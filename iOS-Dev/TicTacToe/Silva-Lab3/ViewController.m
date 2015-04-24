//
//  ViewController.m
//  Silva-Lab3
//
//  Created by Labuser on 2/12/13.
//  Copyright (c) 2013 Labuser. All rights reserved.
//

#import "ViewController.h"
#import "MyPoint.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize currentPlayerLabel;

- (void)viewDidLoad
{
    
    
    
    [super viewDidLoad];
    numTurns = 0;
    appDelegate = [[UIApplication sharedApplication] delegate];
    if(!gameStarted) appDelegate->firstPlayerChosen=FALSE;
    if(!appDelegate->firstPlayerChosen) firstPlayer = Random;
    
    if(gameStarted){
        
        // Selects the letter randomly
        int rand = (NSUInteger)arc4random() % 2;
        if(rand == 1){ p1 = 'x'; p2 = 'o';}
            else {p1 = 'o'; p2 = 'x';}

        // Selects first player - namePlayer1(p1) goes first, than namePlayer2(p2)
        if(firstPlayer == Random){
            if(rand == 0) firstPlayer = Player1;
            else firstPlayer = Player2;
        }
        
        if(firstPlayer == Player1){
            appDelegate.namePlayer1 = appDelegate.textField1;
            if(iphonePlays)
                appDelegate.namePlayer2 = @"iPhone";
            else appDelegate.namePlayer2 = appDelegate.textField2;
        } else{
            appDelegate.namePlayer2 = appDelegate.textField1;
            if(iphonePlays)
                appDelegate.namePlayer1 = @"iPhone";
            else appDelegate.namePlayer1 = appDelegate.textField2;
        }
        
        if(firstPlayer == Player2 && iphonePlays){
            [self iphoneTurn:nil];
            NSLog(@"%@", appDelegate.namePlayer2);
            [self.currentPlayerLabel setText:  appDelegate.namePlayer2];
        } else [self.currentPlayerLabel setText:  appDelegate.namePlayer1];
    }
    
    
            NSLog(@"P1 %c %@", p1, appDelegate.namePlayer1);
            NSLog(@"P2 %c %@", p2, appDelegate.namePlayer2);
    
    
	// Do any additional setup after loading the view, typically from a nib.
}


// Method to set if there are 2 players or Player 1 vs iPhone
- (IBAction)setPlayMode:(id)sender{
    
    // Case it is not a button, do nothing
    if(![sender isKindOfClass:[UIButton class]]) return;
    
    // Checks if the user pushed the button for 1 (computerPlays) or 2 players
    if(self.onePlayerBtn == sender && !iphonePlays){
        iphonePlays = TRUE;
        [self.Player2Field setAlpha:0.0];
        [sender setTitle:@"X" forState:UIControlStateNormal];
        [self.Player2Label setText:@"iPhone"];
    }
    else{
        iphonePlays = FALSE;
        [self.Player2Field setAlpha:1.0];
        [sender setTitle:@"" forState:UIControlStateNormal];
        [self.Player2Label setText:@"Player 2"];
    }
}

// Method to set who will start playing
- (IBAction)setFirstPlayer:(id)sender{
    
    // Case it is not a button, do nothing
    if(![sender isKindOfClass:[UIButton class]]) return;
    
    // Clean the current firstPlayer
    firstPlayer = Random;
    appDelegate->firstPlayerChosen = FALSE;
    if([sender currentTitle] == nil){
        if([sender isEqual:self.Player1Btn]){
            firstPlayer = Player1; // You are the first player
            appDelegate->firstPlayerChosen = TRUE;
            [self.Player2Btn setTitle:nil forState:UIControlStateNormal];
        }
        else{
            firstPlayer = Player2; // The iphone or Someone is first player
            appDelegate->firstPlayerChosen = TRUE;
            [self.Player1Btn setTitle:nil forState:UIControlStateNormal];
        }
        [sender setTitle:@"X" forState:UIControlStateNormal];
    } else
        [sender setTitle:nil forState:UIControlStateNormal];
    
    
}

// Auxiliar method to close the windown and make a signal that it is going to start the game
- (IBAction)endEditing:(id)sender {
    // Closes the keyboard
    [sender resignFirstResponder];
    // Saves textbox values
    if(![self.Player1Field.text isEqual:@""])
        appDelegate.textField1 = self.Player1Field.text;
    else appDelegate.textField1 = @"Player 1";
    if(![self.Player2Field.text isEqual:@""])
        appDelegate.textField2 = self.Player2Field.text;
    else appDelegate.textField2 = @"Player 2";
        gameStarted = TRUE;
    
}

- (IBAction)startGame:(id)sender {
    // Checks if the first player is random
    if(!([[self.Player1Btn currentTitle] isEqual:@"X"] || [[self.Player2Btn currentTitle] isEqual:@"X"]))
       self.firstPlayer = Random;
    
}

// Auxiliar Method to convert point to int
- (int)pointToIndex:(MyPoint*)p{
    NSLog(@"RAND: %d,%d", p->x, p->y);
    return 3*p->x+p->y+1;
}


- (MyPoint*) indexToPoint:(int)square{
    //Checking the row
    double ceiling = ceil(((double)square)/3.0)-1;
    NSLog(@"ceil: %f", ceiling);
    int x = (int)ceiling;
    NSLog(@"X: %d", x);
    
    
    // Checking the column
    int y = 0;
    switch ((square*10) % 3) {
        case 0: y = 2; break;
        default:
            y = ((square*10) % 3) - 1;
    }
    NSLog(@"Y: %d", y);
    MyPoint *p = [[MyPoint alloc] initWithValues:x y:y value:matrix[x][y]];
    
    return p;
    
    
}

-(int) numOpenCorners{
    int i = 0;
    if(matrix[0][0]==0) i++;
    if(matrix[2][2]==0) i++;
    if(matrix[0][2]==0) i++;
    if(matrix[2][0]==0) i++;
    return i;
}






// IPHONE AUXILIAR METHOD: Artificial Inteligence Algorithm
- (int)iPhoneStrategy:(char)p{
    MyPoint *pLine = [[MyPoint alloc] init];
    MyPoint *pCol = [[MyPoint alloc] init];
    MyPoint *pPD = [[MyPoint alloc] init];
    MyPoint *pSD = [[MyPoint alloc] init];
    MyPoint *block = [[MyPoint alloc] initWithValues:0 y:0];
    int rl = 0; //count risky lines
    int rc = 0; // count risky columns
    // count risky primary diagonal
    int rpd = 0;
    //count secondary diagonal
    int rsd = 0;
    // Takes opponent letter
    char q = 0;
    if(p=='x') q = 'o';
    else q = 'x';
    
    // STEP 1: FIRST IPHONE TURN AFTER MIDDLE (3rd TURN) - CHECK CORNERS
    if(numTurns == 2){
        for (int i = 0; i<3; i = i+2)
            for (int j = 0; j<3; j = j+2) {
                //Checks if opponent chose a corner
                if(matrix[i][j]==q){
                    NSLog(@"matrix ij: %d,%d",i, j);
                    switch (i+j) {
                        case 0: pLine->x = 2; pLine->y = 2; break;
                        case 2: pLine->x = j; pLine->y = i; break;
                        case 4: pLine->x = 0; pLine->y = 0; break;
                    }
                    return [self pointToIndex:pLine];
                }
                
            }
    }
    // LAST SQUARE LEFT
    if(numTurns==8){
        for (int i = 1; i<10; i++) {
            block = [self indexToPoint:i];
            if(!block.hasValue) return [self pointToIndex:block];
        }
    }
    
    
    
    // STEP 2: CHECK IF IPHONE (p) CAN WIN OR LOSE NOW
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            //CHECKING LINES
            // check if it is p in line - CAN WIN
            if(matrix[i][j] == p){
                // check line
                rl += 7; // weight 7 if can win since it is First Priority
                // case it is a primary diagonal
                if(i==j) rpd+=7;
                // case it is a secondary diagonal
                if(i+j == 2) rsd+=7;
            } else // ELSE EMPTY SQUARE
                if(matrix[i][j] == 0){
                    pLine->x = i;
                    pLine->y = j;
                    
                    if(i==j){
                        pPD->x = i;
                        pPD->y = j;
                    }
                    if(i+j == 2){
                        pSD->x = i;
                        pSD->y = j;
                    }
                    NSLog(@"matrixij: %d,%d",i, j);
                    
                } else{ // ELSE CAN LOSE
                    // check line
                    rl += 3; // weight 7 if can win
                    // case it is a primary diagonal
                    if(i==j) rpd+=3;
                    // case it is a secondary diagonal
                    if(i+j == 2) rsd+=3;
                    
                }
            
            //CHECKING COLUMNS
            if(matrix[j][i] == p) rc+=7; // Can Win
            else
                if(matrix[j][i] == 0){
                    pCol->x = j;
                    pCol->y = i;
                } else rc+= 3; // Can Lose
            
        }
        // check line and column
        // If Iphone can win, return the square index
        if(rl == 14) return [self pointToIndex:pLine];
        if(rc == 14) return [self pointToIndex:pCol];
        // If Iphone can win, save the square for while
        if(rl == 6){
            block->x = pLine->x;
            block->y = pLine->y;
        }
        if(rc == 6){
            block->x = pCol->x;
            block->y = pCol->y;
        }
        
        rl = 0; rc = 0;
    }
    
    // Check diagonals
    if(rpd == 14) return [self pointToIndex:pPD];
    if(rsd == 14) return [self pointToIndex:pSD];
    if(rpd == 6){
        block->x = pPD->x;
        block->y = pPD->y;
    }
    if(rsd == 6){
        block->x = pSD->x;
        block->y = pSD->y;
    }
    rpd = 0; rsd = 0;
    
    // Take any empty square
    if(block->x == -1 || block->y == -1){
        block =[self indexToPoint:1];
        if(!block.hasValue)
        for (int i = 2; i<=9; i++) {
            block = [self indexToPoint:i];
            if(!block.hasValue) return [self pointToIndex:block];
        }
        
        
    }
    
    
    
    return [self pointToIndex:block];
}



// CONTINUOUS: PLAY THE IPHONE MOVES
- (void) iphoneTurn:(id)sender{
    // Identifies the letter for the current player (x or o)
    
    // Iphone moves if it plays and while game is not over
    char turn;
    
    
    if(numTurns % 2 == 0){
        turn = p1;
    }else{
        turn = p2;
    }
    
    UIImage *bgImage = [UIImage imageNamed:[NSString stringWithFormat:@"%c.jpg", turn]];
    
    // If it is the iPhone first move, its chooses the center, otherwise random
    // PART 1: 0 or 1 unavalable squares
    if (numTurns < 2 && [self checkSquare:5 value:turn]) // Turn 0 and 1
        [self.midBtn setBackgroundImage:bgImage forState:UIControlStateNormal];
    else{
        // Center is not available, there is not enough info to evaluate a better choice, so it will be random between the corners.
        BOOL checked;
        int rand;
        MyPoint *p;
        while(!checked){
            
            // EXCEPTION PLAYER STARTS IN THE CORNER
            if(numTurns == 3){
                // Checks if opponent has 2 opposite corners
                if((matrix[0][0]==matrix[2][2] && matrix[0][0]!=0 && matrix[0][0]!=turn)
                   || (matrix[2][0]==matrix[0][2] && matrix[0][2]!=0 && matrix[0][2]!=turn)){
                    // Play not corners:
                    // 2 [2 = (0,1)] 4 (4 = 1,0) 3 (6 = 1,2) 5(8 = 2,1)
                    rand = abs((int)arc4random() % 6 + 2);
                    p = [self indexToPoint:rand];
                    while (p.hasValue) {
                        rand = abs((int)arc4random() % 6) + 2;
                        if(rand%2 != 0) rand +=3; // Note that for odd numbers: 3 and 5, we can get to 6 and 8
                        p = [self indexToPoint:rand];
                    }
                    
                    NSLog(@"My rand: %d",rand);
                    checked = [self checkSquare:rand value:turn]; // check if turn was completed successfuly
                    if(checked) break;
                }
            }
            
            int sqr = 0;
            
            if(numTurns<4){
                //If there is a corner available, try to get it randomly
                while([self numOpenCorners]>0){
                    // CORNERS: 1 (0,0) - 3 (0,2) - 7 (2, 0) - 9 (2, 2)
                    //case 1 or 3: they are already corners, so do nothing
                    //case 2 or 4: + 5 to get 7 or 9
                    rand = abs((int)arc4random() % 4 +1);
                    if(rand % 2 == 0) rand = rand + 5;
                    p = [self indexToPoint:rand];
                    if(!p.hasValue) break; //If find one available continue
                    
                }
            } else{
                rand = abs((int)arc4random() % 9 +1);
                p = [self indexToPoint:rand];
                while(p.hasValue){ //continue loop while not finding available square
                    rand = abs((int)arc4random() % 9 +1);
                    p = [self indexToPoint:rand];
                }
            }
            NSLog(@"RAND: %d",rand);
            if(numTurns > 2){
                sqr = [self iPhoneStrategy:turn];
                NSLog(@"SQR: %d",sqr);
                if(sqr > 0){
                    p = [self indexToPoint:sqr];
                    if(!p.hasValue) rand = sqr;
                }
            }
            p = [self indexToPoint:rand];
            if(!p.hasValue)
                checked = [self checkSquare:rand value:turn]; // check if turn was completed successfuly
            
        }
        
        if (checked){
            for (UIButton *b in self.buttons)
                if([[b currentTitle] intValue]==rand){
                    [b setBackgroundImage:bgImage forState:UIControlStateNormal];
                    break;
                }
        }
        
    }
}

// CONTINUOUS: EVERY TIME A SQUARE IS CHANGED
// This method transforms the button index into a matrix index (x, y)
- (BOOL) checkSquare:(int)square value:(char)turn
{
    NSLog(@"BTN ID: %d", square);
    MyPoint *p = [self indexToPoint:square];
    
    if(matrix[p->x][p->y] == 'x' || matrix[p->x][p->y] == 'o' || p->x < 0 || p->x < 0) return FALSE;
    matrix[p->x][p->y] = turn;
    return TRUE;
    
    
}


// CONTINUOUS: EVERY TIME USER CLICKS SQUARES
- (IBAction)playStep:(id)sender{
    
    // Case it is not a button, do nothing
    if(![sender isKindOfClass:[UIButton class]]) return;
    if(iphonePlays && firstPlayer == Player2 && numTurns == 0) numTurns = 1; // adjust turn for iphone starts mode
    
    // Variables to check whose the turn and if the game is over
    char winner = 0;
    char turn = '0';
    
    
    int idSquare = [[sender currentTitle] intValue];
    //Check if a valid button was clicked
    MyPoint *p = [self indexToPoint:idSquare];
    if(p.hasValue) return;
    
    // Identifies the letter for the current player
    if(numTurns % 2 == 0){
        turn = p1;
        if(!iphonePlays) [self.currentPlayerLabel setText:  appDelegate.namePlayer2];
    }else{
        turn = p2;
        if(!iphonePlays) [self.currentPlayerLabel setText:  appDelegate.namePlayer1];
    }
    UIImage *bgImage = [UIImage imageNamed:[NSString stringWithFormat:@"%c.jpg", turn]];
    
    if ([self checkSquare:idSquare value:turn]) {
        [sender setBackgroundImage:bgImage forState:UIControlStateNormal];
    };
    
    
    
    // Increments the number of turns to switch turn
    numTurns++;
    NSLog(@"turn %d", numTurns);
    
    // Checks if the game is over
    if(numTurns>3) winner = [self checkVictory];
    NSLog(@"winner %c", winner);
    
    
    
    // End the game
    if(winner!=0){
        [self endGame:winner];
        return;
    }
    if(iphonePlays && !gameOver){
    // If the game continues Calls the iphone automatic turn
        [self iphoneTurn:sender];
        // Increments the number of turns to switch turn
        numTurns++;
        NSLog(@"turn %d", numTurns);

        // Checks if the game is over
        if(numTurns>3) winner = [self checkVictory];
        NSLog(@"winner %c", winner);
        
        // End the game
        if(winner!=0 || numTurns == 9){
            [self endGame:winner];
            return;
        }
    }

    
}




// CLOSE TO THE END: Check if someone won or the game is over
- (char)checkVictory
{
    // count blank spaces
    int blank = 0;
    
    // count line by line
    int lx = 0;
    int lo = 0;
    // count column by column
    int cx = 0;
    int co = 0;
 
    
    for (int i = 0; i < 3; i++) {
        
        for (int j = 0; j < 3; j++) {
            //CHECKING LINES
            // check if it is x
            if(matrix[i][j] == 'x') lx++; // Increments x for line
            else
                if(matrix[i][j] == 'o') lo++; // it is a blank space
                    else  blank++;
            
            //CHECKING COLUMNS
            if(matrix[j][i] == 'x') cx++;
            else if (matrix[j][i] == 'o') co++;
            // If any case matches, it is blank
            // if(matrix[i][j]==0)
        } // NEXT LOOP       
        // Computes victory by line and clears if no victory
        if(lx == 3) return 'x';
        if(lo == 3) return 'o';
        lo = 0; lx = 0;
        
        // Computes victory by column and clears if no victory
        if(cx == 3) return 'x';
        if(co == 3) return 'o';
        co = 0; cx = 0;
    } // NEXT LOOP
    
    // Checking diagonals
    if(matrix[1][1]==matrix[0][0] && matrix[1][1]==matrix[2][2]) return matrix[1][1];
    if(matrix[1][1]==matrix[0][2] && matrix[1][1]==matrix[2][0]) return matrix[1][1];
    
    
    if(blank == 0){
        gameOver = TRUE;
        return 'e';
    }
    
    return FALSE;
}


// END: Show final messages
- (void)endGame:(char)winner
{
    
    // Set the message with the game results
    NSString *message;
    if(winner == p1) message = [NSString stringWithFormat:@"%@ won! \nNew game?", appDelegate.namePlayer1];
    else
        if(winner == p2) message = [NSString stringWithFormat:@"%@ won! \nNew game?", appDelegate.namePlayer2];
        else message = @"Nobody won! \nNew game?";
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Over" message:message delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    [alert show];
    
    
    
}


// END: After confirmation, go back to the menu to restart a new game
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"YES"])
    {
        [self.navigationController popToRootViewControllerAnimated:YES]; // No Or Yes if you would like to have an animation.
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
