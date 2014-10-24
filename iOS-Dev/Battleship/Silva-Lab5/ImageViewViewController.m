//
//  ImageViewViewController.m
//  Silva-Lab5
//
//  Created by Labuser on 4/1/13.
//  Copyright (c) 2013 WUSTL. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import <QuartzCore/QuartzCore.h>
#import "ImageViewViewController.h"
#import "MyPoint.h"
#include <math.h>

@implementation ImageViewViewController

@synthesize points, imgBoat, imgDestroyer, imgSubmarine, imgBattleship, imgCarrier, player1NameLabel, player2NameLabel, fireView;
@synthesize shipImages1, shipImages2, targetImages1, targetImages2, bombs;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //lines = [[NSArray alloc] initWithObjects:CGPointMake(375, 185), CGPointMake(418, 185),
     appDelegate = [[UIApplication sharedApplication] delegate];
    
    coordX[0] = 375;    coordY[0] = 185;
    coordX[1] = 418;    coordY[1] = 220;
    coordX[2] = 455;    coordY[2] = 260;
    coordX[3] = 495;    coordY[3] = 300;
    coordX[4] = 530;    coordY[4] = 340;
    coordX[5] = 570;    coordY[5] = 375;
    coordX[6] = 605;    coordY[6] = 420;
    coordX[7] = 640;    coordY[7] = 460;
    coordX[8] = 680;    coordY[8] = 495;
    coordX[9] = 720;    coordY[9] = 530;
    
    numShipsP1 = 5;
    numShipsP2 = 5;
    
    shipP1B = 4;
    shipP1C = 5;
    shipP1D = 3;
    shipP1S = 3;
    shipP1P = 2;
    
    shipP2B = 4;
    shipP2C = 5;
    shipP2D = 3;
    shipP2S = 3;
    shipP2P = 2;
    
    shipImages1 = [[NSMutableArray alloc] init];
    shipImages2 = [[NSMutableArray alloc] init];
    targetImages1 = [[NSMutableArray alloc] init];
    targetImages2 = [[NSMutableArray alloc] init];
    
    for (int i  = 0; i < 17; i++) {
        // PP DDD SSS BBBB CCCCC -> INITIALIZING LIFE
        switch (i) {
            case 0:
            case 1:
                lifeP1[i] = 'P';
                lifeP2[i] = 'P';
                break;
            case 2:
            case 3:
            case 4:
                lifeP1[i] = 'D';
                lifeP2[i] = 'D';
                break;
            case 5:
            case 6:
            case 7:
                lifeP1[i] = 'S';
                lifeP2[i] = 'S';
                break;
            case 8:
            case 9:
            case 10:
            case 11:
                lifeP1[i] = 'B';
                lifeP2[i] = 'B';
                break;
            default:
                lifeP1[i] = 'C';
                lifeP2[i] = 'C';
                break;
        }
        
    }
    
    for (int i = 0; i<10; i++) {
        shipVertical[0]= FALSE; // @"P1", @"P2", @"D1", @"D2", @"S1", @"S2",  @"B1",  @"B2", @"C1", @"C2"
    }
    
    
    
    
    bombs = [[NSMutableArray alloc] init];
 
    self.turnBtn.hidden = TRUE;
    self.fireBtn.hidden = TRUE;
    
    shipImages = [[NSMutableArray alloc] init];
    [shipImages addObject:imgBoat];
    [shipImages addObject:imgDestroyer];
    [shipImages addObject:imgSubmarine];
    [shipImages addObject:imgBattleship];
    [shipImages addObject:imgCarrier];
    
    
    if(appDelegate->turn == 2){
        player1NameLabel.text = [[NSString alloc] initWithFormat:@"PLAYER: %@", appDelegate.pname2];
        player2NameLabel.text = [[NSString alloc] initWithFormat:@"Opponent: %@", appDelegate.pname1];
    }else{
        player1NameLabel.text = [[NSString alloc] initWithFormat:@"PLAYER: %@", appDelegate.pname1];
        player2NameLabel.text = [[NSString alloc] initWithFormat:@"Opponent: %@", appDelegate.pname2];
    
    }

    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL) isVertical:(NSString *)ship{
    int i = 0;
    if(appDelegate->turn == 2) i = 1; // PLAYER2 -> ODD INDEXES
    
    switch ([ship characterAtIndex:0]) {
        case 'P':
            return shipVertical[i];
            break;
        case 'D':
            return shipVertical[i+2];
        break;
        case 'S':
            return shipVertical[i+4];
            break;
        case 'B':
            return shipVertical[i+6];
            break;
        case 'C':
            return shipVertical[i+8];
            break;
    }
    
    return FALSE;
}

-(void) setVertical:(NSString *)ship vertical:(BOOL)vertical{
    int i = 0; // PLAYER 1 -> EVEN INDEXES
    if(appDelegate->turn == 2) i = 1; // PLAYER2 -> ODD INDEXES
    
    switch ([ship characterAtIndex:0]) {
        case 'P':
            shipVertical[i] = vertical;
            break;
        case 'D':
            shipVertical[i+2] = vertical;
            break;
        case 'S':
            shipVertical[i+4] = vertical;
            break;
        case 'B':
            shipVertical[i+6] = vertical;
            break;
        case 'C':
            shipVertical[i+8] = vertical;
            break;
    }
    
    
}


// Method to rotate images generic method!
-(void) doRotation:(UIImageView *)image from:(NSNumber*)before to:(NSNumber*) after {
    CABasicAnimation *imageRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    imageRotation.fromValue = before;
    imageRotation.toValue = after;
    imageRotation.duration = 0.1;
    imageRotation.repeatCount = 1;
    imageRotation.removedOnCompletion = NO;
    imageRotation.autoreverses=NO;
    imageRotation.fillMode = kCAFillModeForwards;

    [image.layer addAnimation:imageRotation forKey:@"imageRotation"];
} // END OF rotateImage Display Method


// Method to rotate images and save their status!
-(void) rotateImage:(UIImageView *)image ship: (NSString*) ship save:(BOOL)save reset:(BOOL)reset {
    
    NSNumber *before;
    NSNumber *after;
    
    if(reset){ //clean the current rotations
        [image.layer removeAllAnimations];
    } else{
    
    if(save){
        // SAVE ORIENTATION - PREPARING GRID
        BOOL isVertical = [self isVertical:ship];
        
        if(isVertical){
            before = [NSNumber numberWithFloat:(M_PI_2)];
            after = [NSNumber numberWithFloat:(0)];
        } else{
            before = [NSNumber numberWithFloat:(M_PI_4)];
            after = [NSNumber numberWithFloat:(M_PI_2)];
        }
        [self setVertical:ship vertical:!isVertical];
        [self doRotation:image from:before to:after];
    }else{
        // CHANGE ORIENTATION TO DISPLAY GRID
        BOOL isVertical = [self isVertical:ship];
        
        if(isVertical){
            before = [NSNumber numberWithFloat:(M_PI_4)];
            after = [NSNumber numberWithFloat:(M_PI_2)];
            [self doRotation:image from:before to:after];
        }
    
    }
        

        
    }
} // END OF rotateImage Save status Method

// Shortcut to method above
-(void) rotateImage:(UIImageView *)image ship: (NSString*) ship {
    [self rotateImage:image ship:ship save:FALSE reset:FALSE];
}

-(void) saveRotationImage:(UIImageView *)image ship: (NSString*) ship {
    [self rotateImage:image ship:ship save:TRUE reset:FALSE];
}

-(void) resetRotationImage:(UIImageView *)image {
    [self rotateImage:image ship:@"" save:FALSE reset:TRUE];
}

-(CGPoint) rightPosition:(CGPoint)location {
    
    if(location.x < 360) return location;
    CGPoint myLocation;
    double minDist = 100;
    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 10; j++) {
            double distance = sqrt(pow((location.x - coordX[j]), 2.0) + pow((location.y - coordY[i]), 2.0));
            if(distance < minDist){
                minDist = distance; // closest/shortest distance
                myLocation = CGPointMake(coordX[j], coordY[i]); // right location
            }
        }
    }
    //NSLog(@"Adjust: %f,%f",myLocation.x,myLocation.y);
    return location;
    
}


// Method called on touch sceen detection to move images!
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    if(readyFleet1 && readyFleet2) return; // DO NOTHING! CANNOT CHANGE THE GRID ANYMORE
    
    UITouch *touch = [[event allTouches] anyObject];
    UIImageView *touchedImg;
    NSString *touchedShip;
    
    if(touch.tapCount == 2){
        
        // DOUBLE TOUCH TO ROTATE
        CGPoint location = [touch locationInView:touch.view];
        if (CGRectContainsPoint(imgBoat.frame, location)) {
            //[self saveRotationImage:imgBoat ship:@"P"];
            touchedShip = @"P";
            touchedImg = imgBoat;
            
        } else if (CGRectContainsPoint(imgDestroyer.frame, location)) {
            touchedShip = @"D";
            touchedImg = imgDestroyer;
            //[self saveRotationImage:imgDestroyer ship:@"D"];
        } else if (CGRectContainsPoint(imgSubmarine.frame, location)) {
            touchedShip = @"S";
            touchedImg = imgSubmarine;
            //[self saveRotationImage:imgSubmarine ship:@"S"];
        }else if (CGRectContainsPoint(imgBattleship.frame, location)) {
            touchedShip = @"B";
            touchedImg = imgBattleship;
            //[self saveRotationImage:imgBattleship ship:@"B"];
        }
        else if (CGRectContainsPoint(imgCarrier.frame, location)) {
            touchedImg = imgCarrier;
            touchedShip = @"C";
            //[self saveRotationImage:imgCarrier ship:@"C"];
        }
        [self saveRotationImage:touchedImg ship:touchedShip];
    }
    else
    {
        // DRAG AND DROP
    CGPoint location = [touch locationInView:touch.view];
    
    if (CGRectContainsPoint(imgBoat.frame, location)) {
        //imgBoat.center=location;
        touchedImg = imgBoat;
        touchedShip = @"P";
        imgBoat.center=[self rightPosition:location];
    } else
        if (CGRectContainsPoint(imgDestroyer.frame, location)) {
            touchedImg = imgDestroyer;
            touchedShip = @"D";
            imgDestroyer.center=location;
        } else
            if (CGRectContainsPoint(imgSubmarine.frame, location)) {
                touchedImg = imgSubmarine;
                touchedShip = @"S";
                imgSubmarine.center=location;
            } else
                if (CGRectContainsPoint(imgBattleship.frame, location)) {
                    touchedImg = imgBattleship;
                    touchedShip = @"B";
                    imgBattleship.center=location;
                }else
                    if (CGRectContainsPoint(imgCarrier.frame, location)) {
                        touchedImg = imgCarrier;
                        touchedShip = @"C";
                        imgCarrier.center=location;
                    }
        
 }   
    if(touchedImg.center.x>360){
        for(UIImageView *img in shipImages){
            if([img isEqual:touchedImg]) continue;
            if([img isEqual:imgBoat]){
                [self imagesOverlap:touchedImg name1:touchedShip imageUnder:img name2:@"P"];
            } else
                if([img isEqual:imgDestroyer]){
                    [self imagesOverlap:touchedImg name1:touchedShip imageUnder:img name2:@"D"];
                } else
                    if([img isEqual:imgSubmarine]){
                        [self imagesOverlap:touchedImg name1:touchedShip imageUnder:img name2:@"S"];
                    } else
                        if([img isEqual:imgBattleship]){
                            [self imagesOverlap:touchedImg name1:touchedShip imageUnder:img name2:@"B"];                            
                        } else
                            if([img isEqual:imgCarrier]){
                                [self imagesOverlap:touchedImg name1:touchedShip imageUnder:img name2:@"C"];  
                            } 
            break;
         
            
        }
    } // END OF FOR
} //END OF TOUCH METHOD

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [self touchesBegan:touches withEvent:event];
}
// IMAGE OVERLAPING 
-(void) imagesOverlap:(UIImageView *)img1 name1:(NSString *)imgName1 imageUnder:(UIImageView *)img2 name2:(NSString *)imgName2 {
    BOOL isVertical1 = [self isVertical:imgName1];
    BOOL isVertical2 = [self isVertical:imgName2];
    int w1 = img1.frame.size.width;
    int w2 = img2.frame.size.width;
    overlaps = false;
    if(isVertical1){
        if(isVertical2){
        // BOTH ARE VERTICAL Width = 30 (half 15+e = 20
            if(abs(img1.center.x - img2.center.x) < 30 && 2 * abs(img1.center.y - img2.center.y)<(w1+w2))
               overlaps = true;
        
        } else{
        // IMAGE1 IS VERTICAL AND IMAGE2 IS HORIZONTAL
            if(abs(img1.center.x - img2.center.x) < 15+w2/2 && 2 * abs(img1.center.y - img2.center.y)<(w1+15))
                overlaps = true;
        }
    }else{
        if(isVertical2){
         // IMAGE1 IS HORIZONTAL AND IMAGE2 IS VERTICAL
            if(abs(img1.center.x - img2.center.x) < 15+w1/2 && 2 * abs(img1.center.y - img2.center.y)<(w2+15))
                overlaps = true;
            
        } else{
         // BOTH IMAGES ARE HORIZONTAL
            if(2 * abs(img1.center.x - img2.center.x) < w1+w2 && abs(img1.center.y - img2.center.y)<30)
                overlaps = true;
        }
    }
    if(overlaps){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ships Overlaping!" message:@"You have ships overlaping each other. Please try a different location." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK" , nil];
        [alert show];
        img1.center = CGPointMake(img1.center.x+20 , img1.center.y);
        img2.center = CGPointMake(img2.center.x-20, img2.center.y);
    }
}

// SAVING MY GRID
- (IBAction)saveGrid:(id)sender {
    //First check if images don't overlap
    if(overlaps){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ships Overlaping!" message:@"You have ships overlaping each other. Please try a different location before saving it." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK" , nil];
        [alert show];
        return;
    }
    
    
    BOOL outGrid = FALSE;
    for (UIImageView *img in shipImages) {
        
        if(img.center.x - img.layer.frame.size.width/2 < 350 || img.center.x + img.layer.frame.size.width/2 > 750 ||
            img.center.y - img.layer.frame.size.height/2 < 160 || img.center.y + img.layer.frame.size.height/2 > 560){
                outGrid = TRUE;
            }
        
    }

    if(outGrid){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Unplaced Ships!" message:@"You have 1 or more ships out of the grid. Please place them inside the grid to start playing." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK" , nil];
        [alert show];
        outGrid = FALSE;
    
    } else{
        
        if(appDelegate->turn != 2){ // Player 1 turn
        
        for (int j = 0; j < 10; j++) {
            for (int i = 0; i < 10; i++) {
                CGPoint location = CGPointMake(coordX[j], coordY[i]);
                if(CGRectContainsPoint(imgBoat.frame, location)){
                    fleetP1[i][j] = 'P';
                    
                } else{
                    if(CGRectContainsPoint(imgDestroyer.frame, location)){
                        fleetP1[i][j] = 'D';
                        
                    } else{
                        if(CGRectContainsPoint(imgSubmarine.frame, location)){
                            fleetP1[i][j] = 'S';
                            
                        } else{
                            if(CGRectContainsPoint(imgBattleship.frame, location)){
                                fleetP1[i][j] = 'B';
                                
                            } else{
                                if(CGRectContainsPoint(imgCarrier.frame, location)){
                                    fleetP1[i][j] = 'C';
                                    
                                }
                
                            }
                        }
                    }
                }
            }
        }
   
        
            // SAVING LOCATIONS
            appDelegate.shipPointsP1 = [[NSMutableArray alloc] initWithObjects:
                                        [[MyPoint alloc] initWithValues:(int)imgBoat.center.x y:(int)imgBoat.center.y value:'P'],
                                        [[MyPoint alloc] initWithValues:(int)imgDestroyer.center.x y:(int)imgDestroyer.center.y value:'D'],
                                        [[MyPoint alloc] initWithValues:(int)imgSubmarine.center.x y:(int)imgSubmarine.center.y value:'S'],
                                        [[MyPoint alloc] initWithValues:(int)imgBattleship.center.x y:(int)imgBattleship.center.y value:'B'],
                                        [[MyPoint alloc] initWithValues:(int)imgCarrier.center.x y:(int)imgCarrier.center.y value:'C'],
                                        nil];
            

        
            readyFleet1 = TRUE;
        
        } else{                                                     // Player 2 turn
            for (int j = 0; j < 10; j++) {
                for (int i = 0; i < 10; i++) {
                    CGPoint location = CGPointMake(coordX[j], coordY[i]);
                    if(CGRectContainsPoint(imgBoat.frame, location)){
                        fleetP2[i][j] = 'P';
                        
                    } else{
                        if(CGRectContainsPoint(imgDestroyer.frame, location)){
                            fleetP2[i][j] = 'D';
                            
                        } else{
                            if(CGRectContainsPoint(imgSubmarine.frame, location)){
                                fleetP2[i][j] = 'S';
                                
                            } else{
                                if(CGRectContainsPoint(imgBattleship.frame, location)){
                                    fleetP2[i][j] = 'B';
                                    
                                } else{
                                    if(CGRectContainsPoint(imgCarrier.frame, location)){
                                        fleetP2[i][j] = 'C';
                                        
                                    }
                                    
                                }
                            }
                        }
                    }
                }
            }

            
            
            // SAVING LOCATIONS
            appDelegate.shipPointsP2 = [[NSMutableArray alloc] initWithObjects:
                                        [[MyPoint alloc] initWithValues:(int)imgBoat.center.x y:(int)imgBoat.center.y value:'P'],
                                        [[MyPoint alloc] initWithValues:(int)imgDestroyer.center.x y:(int)imgDestroyer.center.y value:'D'],
                                        [[MyPoint alloc] initWithValues:(int)imgSubmarine.center.x y:(int)imgSubmarine.center.y value:'S'],
                                        [[MyPoint alloc] initWithValues:(int)imgBattleship.center.x y:(int)imgBattleship.center.y value:'B'],
                                        [[MyPoint alloc] initWithValues:(int)imgCarrier.center.x y:(int)imgCarrier.center.y value:'C'],
                                        nil];
            readyFleet2 = TRUE;
            
            
            
        }// END ELSE (SAVE PLAYER 2)
        
       
        if(appDelegate->twoPlayers){
           for (UIImageView *img in shipImages) {
                [self resetRotationImage:img];
           }
            
            self.playerGrid.hidden = TRUE;
            
           //PTBOAT 282, 224
            imgBoat.center = CGPointMake(278, 222);
           //PTBOAT 260, 267
            imgDestroyer.center = CGPointMake(263, 266);
            //PTBOAT 265, 310
            imgSubmarine.center = CGPointMake(263, 312);
            //PTBOAT 240, 360
            imgBattleship.center = CGPointMake(246, 358);
            //PTBOAT 225, 400
            imgCarrier.center = CGPointMake(227, 400);

            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fleet Saved!" message:@"Your fleet was successfully saved! Click on FINISH TURN to allow the next player to play." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK" , nil];
            [alert show];
            
        } else{
            // CODE FOR COMPUTER PLAYS
            [self autoPlay];

            
        }// END ONE PLAYER
        if(appDelegate->twoPlayers)
            self.turnBtn.hidden = FALSE;
        else{
            for (UIButton *b in points) 
                [b setBackgroundColor: [UIColor clearColor]];
        }
        self.saveBtn.hidden = TRUE;
        
}

    


} // END OF START BATTLE


- (void) loadPlayer:(int)turn {
    NSMutableArray *shippoints;
    
    if(turn == 2){
        shippoints = [appDelegate.shipPointsP2 copy];
    }else{
       shippoints = [appDelegate.shipPointsP1 copy];
    }
    
    if(readyFleet1 && readyFleet2)
      for(UIImageView *ship in shipImages){
          [self rotateImage:ship ship:nil save:FALSE reset:TRUE];
      }// END OF FOR SHIPPOINTS
    
    NSMutableArray *ships;
    if(turn == 2) ships = shipImages2;
        else ships = shipImages1;
    if(ships.count == 0){
    UIImageView *img= nil;

    for (MyPoint *p in shippoints) {
        switch (p->value) {
            case 'P':
                img = [[UIImageView alloc] initWithImage:imgBoat.image];
                [img setFrame:imgBoat.frame];
                img.center =  CGPointMake(p->x, p->y);
                [self rotateImage:img ship:@"P"];
                
                [self.view addSubview:img];
                [ships addObject:img];
                break;
            case 'D':
                img = [[UIImageView alloc] initWithImage:imgDestroyer.image];
                [img setFrame:imgDestroyer.frame];
                [self rotateImage:img ship:@"D"];
                
                img.center =  CGPointMake(p->x, p->y);
                [self.view addSubview:img];
                [ships addObject:img];
                break;
            case 'S':
                img = [[UIImageView alloc] initWithImage:imgSubmarine.image];
                [img setFrame:imgSubmarine.frame];
                [self rotateImage:img ship:@"S"];
                img.center =  CGPointMake(p->x, p->y);
                [self.view addSubview:img];
                [ships addObject:img];
                
                break;
            case 'B':
                img = [[UIImageView alloc] initWithImage:imgBattleship.image];
                [img setFrame:imgBattleship.frame];
                [self rotateImage:img ship:@"B"];
                img.center =  CGPointMake(p->x, p->y);
                [self.view addSubview:img];
                [ships addObject:img];
                
                break;
            case 'C':
                img = [[UIImageView alloc] initWithImage:imgCarrier.image];
                [img setFrame:imgCarrier.frame];
                [self rotateImage:img ship:@"C"];
                img.center =  CGPointMake(p->x, p->y);
                [self.view addSubview:img];
                [ships addObject:img];
                break;
        }
    }// END OF FOR SHIPPOINTS
    }//end of if ships == 0

}


- (IBAction)fire:(id)sender {
    fireBomb = TRUE;

    
    BOOL readyToFire = FALSE;
    // Check if all bombs were placed
    if(appDelegate->turn == 2){
        if(numBombsP2==numShipsP2) readyToFire= TRUE;
    
    } else{
        if(numBombsP1==numShipsP1) readyToFire= TRUE;

    }
    
    
    if(bombs.count == 0){
        fireBomb = FALSE;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"NO BOMBS!" message:@"You exploded all bombs, please click on FINISH TURN" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK" , nil];
        [alert show];
        
        return;
    }
    
    if(readyToFire){
        
        if(bombs.count == 1) self.turnBtn.hidden = FALSE;
        // LOADING SOUNDS TO PLAY
        SystemSoundID explosionSound;
        NSURL *fileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"explosion" ofType:@"WAV"]];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) fileURL, &explosionSound);

        UIImage *img;
        UIButton *button;
        
        //CAPTURE FIRST BUTTON WITH BOMB
        
        MyPoint *p = [bombs lastObject];
        NSString *title;
        for (UIButton *b in points) {
            title = [[[b currentTitle] componentsSeparatedByString:@"=*"] objectAtIndex:0];
            if([[[title componentsSeparatedByString:@"."] objectAtIndex:0] intValue] == p->x+1 && p->y+1 == [[[title componentsSeparatedByString:@"."] objectAtIndex:1] intValue]){
                button = b;
                break;
                
            }
        }
        
        //if ([[button currentTitle] rangeOfString:@"=*"].location == NSNotFound)  return;
            
            
        
        bool shipSunk;
        NSString *ship;
        UIImageView *newImg;
        
        if(appDelegate->turn == 2){ //FOR TURN = PLAYER 2
            if(fleetP1[p->x][p->y]=='X') return; // place already shot
            if(fleetP1[p->x][p->y]==0){
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Empty Place!" message:@"Sorry, you didn't explode any target!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK" , nil];
                [alert show];
                
                img = [UIImage imageNamed:@"x.png"];
                
                newImg = [[UIImageView alloc] initWithImage:img];
                [newImg setFrame:fireView.frame];
                newImg.contentMode = UIViewContentModeScaleAspectFit;
                newImg.center =  CGPointMake(coordX[p->y], coordY[p->x]);
                [self.view addSubview:newImg];
                [self.view bringSubviewToFront:newImg];
                newImg.hidden = TRUE;
                [targetImages1 addObject:newImg];
               // numBombsP1--;
                fleetP1[p->x][p->y]='O';
            }else{
               
                switch (fleetP1[p->x][p->y]) {
                    case 'P':
                        shipP1P--;
                        if(shipP1P==0){
                            shipSunk = true;
                            ship = @"PT BOAT";
                            numShipsP1--;
                        }
                        
                        break;
                    case 'D':
                        shipP1D--;
                        if(shipP1D==0){
                            shipSunk = true;
                            ship = @"DESTROYER";
                            numShipsP1--;
                        }
                        
                        break;
                    case 'S':
                        shipP1S--;
                        if(shipP1S==0){
                            shipSunk = true;
                            ship = @"SUBMARINE";
                            numShipsP1--;
                        }
                        break;
                    case 'B':
                        shipP1B--;
                        if(shipP1B==0){
                            shipSunk = true;
                            ship = @"BATTLESHIP";
                            numShipsP1--;
                        }
                        break;
                    case 'C':
                        shipP1C--;
                        if(shipP1C==0){
                            shipSunk = true;
                            ship = @"CARRIER";
                            numShipsP1--;
                        }
                        break;
                    default:
                        break;
                        
                }// end FOR SWITCH
                
                img = [UIImage imageNamed:@"fire.png"];
                newImg = [[UIImageView alloc] initWithImage:img];
                [newImg setFrame:fireView.frame];
                newImg.contentMode = UIViewContentModeScaleAspectFit;
                newImg.center =  CGPointMake(coordX[p->y], coordY[p->x]);
                [self.view addSubview:newImg];
                [self.view bringSubviewToFront:newImg];
                newImg.hidden = TRUE;
                [targetImages1 addObject:newImg];
                //numBombsP1--;
                
                
            } // END OF ELSE grid value different than 0
             
        } // END OF TURN = PLAYER 2
        else{// TURN = PLAYER 1
            if(fleetP2[p->x][p->y]=='X') return; // place already shot
            if(fleetP2[p->x][p->y]==0){
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Empty Place!" message:@"You didnt explode any target" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK" , nil];
                [alert show];
                img = [UIImage imageNamed:@"x.png"];
                newImg = [[UIImageView alloc] initWithImage:img];
                [newImg setFrame:fireView.frame];
                newImg.contentMode = UIViewContentModeScaleAspectFit;
                newImg.center =  CGPointMake(coordX[p->y], coordY[p->x]);
                [self.view addSubview:newImg];
                [self.view bringSubviewToFront:newImg];
                newImg.hidden = TRUE;
                [targetImages2 addObject:newImg];
                //numBombsP2--;
                fleetP2[p->x][p->y]='O';
            }else{
                
            
                NSString *msg;
                UIAlertView *alert;
                switch (fleetP2[p->x][p->y]) {
                case 'P':
                    shipP2P--;
                    if(shipP2P==0){
                        shipSunk = true;
                        ship = @"PT BOAT";
                        numShipsP2--;
                        msg = [[NSString alloc] initWithFormat: @"You destroyed the ship %@ of the enemy's ships!!! Now they have less power against you!", ship];
                        alert = [[UIAlertView alloc] initWithTitle:@"CONGRATULATIONS!" message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK" , nil];
                        [alert show];
                    }
                    
                    break;
                case 'D':
                    shipP2D--;
                    if(shipP2D==0){
                        shipSunk = true;
                        ship = @"DESTROYER";
                        numShipsP2--;
                        msg = [[NSString alloc] initWithFormat: @"You destroyed the ship %@ of the enemy's ships!!! Now they have less power against you!", ship];
                        alert = [[UIAlertView alloc] initWithTitle:@"CONGRATULATIONS!" message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK" , nil];
                        [alert show];
                    }

                    break;
                case 'S':
                    shipP2S--;
                    if(shipP2S==0){
                        shipSunk = true;
                        ship = @"SUBMARINE";
                        numShipsP2--;
                        msg = [[NSString alloc] initWithFormat: @"You destroyed the ship %@ of the enemy's ships!!! Now they have less power against you!", ship];
                        alert = [[UIAlertView alloc] initWithTitle:@"CONGRATULATIONS!" message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK" , nil];
                        [alert show];
                    }
                    break;
                case 'B':
                    shipP2B--;
                    if(shipP2B==0){
                        shipSunk = true;
                        ship = @"BATTLESHIP";
                        numShipsP2--;
                        msg = [[NSString alloc] initWithFormat: @"You destroyed the ship %@ of the enemy's ships!!! Now they have less power against you!", ship];
                        alert = [[UIAlertView alloc] initWithTitle:@"CONGRATULATIONS!" message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK" , nil];
                        [alert show];
                    }
                    break;
                case 'C':
                    shipP2C--;
                    if(shipP2C==0){
                        shipSunk = true;
                        ship = @"CARRIER";
                        numShipsP2--;
                        msg = [[NSString alloc] initWithFormat: @"You destroyed the ship %@ of the enemy's ships!!! Now they have less power against you!", ship];
                        alert = [[UIAlertView alloc] initWithTitle:@"CONGRATULATIONS!" message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK" , nil];
                        [alert show];
                    }
                    break;
                    
                default:
                    break;
                    
            }// end FOR SWITCH
                img = [UIImage imageNamed:@"fire.png"];
                newImg = [[UIImageView alloc] initWithImage:img];
                [newImg setFrame:fireView.frame];
                newImg.contentMode = UIViewContentModeScaleAspectFit;
                newImg.center =  CGPointMake(coordX[p->y], coordY[p->x]);
                [self.view addSubview:newImg];
                [self.view bringSubviewToFront:newImg];
                newImg.hidden = TRUE;
                [targetImages2 addObject:newImg];
                
            //numBombsP2--;
                
            
                fleetP2[p->x][p->y]='X';
                if(!shipSunk){
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"YOU GOT IT!" message:@"Your bomb exploded in one of the ships of the enemy, but it is still on!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK" , nil];
                [alert show];

                }
            }// END OF fleetP2[]!=0 
        } // END OF TURN PLAYER 1
            
    
        // CHANGE IMAGE 
        [button setImage:img forState:UIControlStateNormal];
        button.contentMode = UIViewContentModeScaleAspectFit;
        AudioServicesPlaySystemSound(explosionSound); //PLAY EXPLOSION
        
        
        [bombs removeLastObject];
            
            if(bombs.count == 0){
                self.fireBtn.hidden = TRUE;
                self.turnBtn.hidden = FALSE;
            }
    
        NSString *msg1;
        NSString *msg2;
        if(appDelegate->turn == 2){
            msg1 = [[NSString alloc] initWithFormat:@"YOUR FLEET                              Total: %d ships", numShipsP2];
            msg2 = [[NSString alloc] initWithFormat:@"ENEMY FLEET                            Total: %d ships", numShipsP1];
        }else{
            msg1 = [[NSString alloc] initWithFormat:@"YOUR FLEET                              Total: %d ships", numShipsP1];
            msg2 = [[NSString alloc] initWithFormat:@"ENEMY FLEET                            Total: %d ships", numShipsP2];
        
        }
        [self.labelStatusP1 setText:msg1];
        [self.labelStatusP2 setText:msg2];
        [self checkWinner];
        
        
    }// END OF IF READY TO FIRE
    
} // END OF FIRE
    
- (void) checkWinner {
    if(shipP1B == 0 && shipP1C && shipP1D ==0 && shipP1S ==0 && shipP1D==0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"GAME OVER!" message:[[NSString alloc] initWithFormat:@"Player %@ won!!!", appDelegate.pname2] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK" , nil];
        [alert show];
    
    } else
        if(shipP2B == 0 && shipP2C && shipP2D ==0 && shipP2S ==0 && shipP2D==0){
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"GAME OVER!" message:[[NSString alloc] initWithFormat:@"Player %@ won!!!", appDelegate.pname2] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK" , nil];
                [alert show];
        }
    
    
} //END OF CHECK WINNER


- (IBAction)setBomb:(id)sender {
    
    if(fireBomb){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"FIRE bombs!" message:@"You started firing bombs! Now you cannot change your bombs. Fire each bomb you have and finish the turn." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK" , nil];
        [alert show];
    
    } else
    if(readyFleet1 && readyFleet2){
        self.turnBtn.hidden = TRUE;
        BOOL maxBombs= FALSE;
        
        NSString *title = [(UIButton*) sender currentTitle];
        NSLog(@"TITLE: %@", title);
        if([title rangeOfString:@"="].location == NSNotFound){ // INSERT BOMB
            // CHECK NUM OF BOMBS
            if(appDelegate->turn == 2){
                if(numBombsP2 >= numShipsP2)
                    maxBombs = TRUE;
                if(numBombsP2+1 >= numShipsP2) self.fireBtn.hidden = FALSE;
                
            }else{
                if (numBombsP1 >= numShipsP1)
                    maxBombs = TRUE;
                if(numBombsP1+1 >= numShipsP1) self.fireBtn.hidden = FALSE;
            }
            // IF HAVE BOMB
            if(!maxBombs){
                    
                int px = [[[title componentsSeparatedByString:@"."] objectAtIndex:0] intValue]-1;
                int py = [[[title componentsSeparatedByString:@"."] objectAtIndex:1] intValue]-1;
                [bombs addObject:[[MyPoint alloc] initWithValues: px y: py]];
                NSLog(@"POINT: (%d,%d)", px, py);
            
                [(UIButton*) sender setTitle: [title stringByAppendingString:@"=*"] forState:UIControlStateNormal];
                UIImage *img = [UIImage imageNamed:@"bomb.png"];
                [sender setImage:img forState:UIControlStateNormal];
                [sender setContentMode:UIViewContentModeScaleAspectFit];
                
                if(appDelegate->turn == 2)
                    numBombsP2++;
                else numBombsP1++;
            } else{ // NO MORE BOMBS - MAX ALLOWED
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No bombs!" message:@"You have placed the maximum of bombs possible for your number of ships. Remove some bombs to add place on different position or click on FIRE when you are done to explode each of them." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK" , nil];
                [alert show];
            
            }
             
        }
        //REMOVE BOMB ELSE OF = NOT FOUND
        if ([title rangeOfString:@"=*"].location != NSNotFound) { 
                title = [[title componentsSeparatedByString:@"=*"] objectAtIndex:0];
                [(UIButton*) sender setTitle: title forState:UIControlStateNormal];
                
                int px = [[[title componentsSeparatedByString:@"."] objectAtIndex:0] intValue]-1;
                int py = [[[title componentsSeparatedByString:@"."] objectAtIndex:1] intValue]-1;
            // REMOVING BOMB OBJECT

            for (MyPoint *p1 in bombs)
                if(p1->x == [[[title componentsSeparatedByString:@"."] objectAtIndex:0] intValue]-1 &&
                   p1->y == [[[title componentsSeparatedByString:@"."] objectAtIndex:1] intValue]-1 ){
                    [bombs removeObject:p1];
                    break;
                }
            
                        
                NSLog(@"POINT: (%d,%d)", px, py);
                [sender setImage:nil forState:UIControlStateNormal];
                if(appDelegate->turn == 2)
                    numBombsP2--;
                    else numBombsP1--;
            }//END REMOVE
    } // END IF FLEETS ARE READY
    
    
   
    
} // END OF SET BOMB


// ** FINISH TURN METHOD **
- (IBAction)finishTurn:(id)sender {
   
    
    //CLEAN VARIABLES FOR BOMBS
    numBombsP1 = 0;
    numBombsP2 = 0;
    fireBomb = FALSE;
    fireBomb = FALSE;
    bombs = [[NSMutableArray alloc] init];
    
    if(appDelegate->turn == 2){
        appDelegate->turn = 1;
        player1NameLabel.text=[@"PLAYER: " stringByAppendingString:appDelegate.pname1];
        player2NameLabel.text=[@"Opponent: " stringByAppendingString:appDelegate.pname2];
                               
    }
    else{
        appDelegate->turn = 2;
        player1NameLabel.text=[@"PLAYER: " stringByAppendingString:appDelegate.pname2];
        player2NameLabel.text=[@"Opponent: " stringByAppendingString:appDelegate.pname1];
    }
    self.saveBtn.hidden = FALSE;
    self.playerGrid.hidden = FALSE;
    
    
    if(readyFleet1 && readyFleet2){
        
        for (UIButton *b in points) {
            [b setBackgroundColor: [UIColor clearColor]];
            NSString *title = [[[b currentTitle]componentsSeparatedByString:@"=*"] objectAtIndex:0];
            int x = [[[title componentsSeparatedByString:@"."] objectAtIndex:0] intValue]-1;
            int y =[[[title componentsSeparatedByString:@"."] objectAtIndex:1] intValue]-1;
            UIImage *img;
            
            if(appDelegate->turn == 2){
                // CONFIGURE UPPER GRID WITH PLAYER 2 INFO
                for (UIImageView *i in shipImages1) {
                    i.hidden = TRUE;
                }
                for (UIImageView *i in targetImages1) {
                    i.hidden = TRUE;
                }
                for (UIImageView *i in targetImages2) {
                    i.hidden = FALSE;
                    for (UIImageView *ship in shipImages2) {
                        ship.hidden = FALSE;
                        if(CGRectContainsPoint(ship.frame, i.center)){
                            [self.view insertSubview:i aboveSubview:ship];
                            [self.view bringSubviewToFront:i];
                        }
                    }
                    
                
                }
                [self.view sendSubviewToBack: self.playerGrid];
   
                
                // CONFIGURE LOWER GRID FOR PLAYER 2 WITH PLAYER 1 INFO
                if(fleetP1[x][y]=='X'){
                    img = [UIImage imageNamed:@"fire.png"];
                    
                } else
                if(fleetP1[x][y]=='O'){
                    img = [UIImage imageNamed:@"x.png"];
                } else img = nil;
            
            
            } else{
                 // CONFIGURE UPPER GRID WITH PLAYER 2 INFO
                
                for (UIImageView *i in shipImages2) {
                    i.hidden = TRUE;
                }
                /*for (UIImageView *i in shipImages1) {
                    i.hidden = FALSE;
                    [self.view sendSubviewToBack: i];
                }*/
                
                for (UIImageView *i in targetImages2) {
                    i.hidden = TRUE;
                }
                for (UIImageView *i in targetImages1) {
                    i.hidden = FALSE;
                    for (UIImageView *ship in shipImages1) {
                        ship.hidden = FALSE;
                        [self.view insertSubview:i aboveSubview:ship];
                    }
                    
                    
                }
                
                
                [self.view sendSubviewToBack: self.playerGrid];
                
                // CONFIGURE LOWER GRID FOR PLAYER 1 WITH PLAYER 2 INFO
                if(fleetP2[x][y]=='X'){
                    img = [UIImage imageNamed:@"fire.png"];
                    
                }
                if(fleetP2[x][y]=='O'){
                   img = [UIImage imageNamed:@"x.png"];
                   
                }else img = nil;
            
            }
            [b setImage:img forState:UIControlStateNormal];
            [b setContentMode:UIViewContentModeScaleAspectFit];
            
        } // END OF FOR POINTS OF SQUARES
        
        [self loadPlayer:appDelegate->turn];
         self.turnBtn.hidden = FALSE;
        self.fireBtn.hidden = TRUE;
        self.saveBtn.hidden = TRUE;

        
    } // END OF IF READY FLEET
  
        
    
    
    

} // END OF FINISH TURN



-(void) autoPlay{
    int x = arc4random() % 10;
    int y = arc4random() % 10;
    
    
    
    // size 5
    if(y+4<10){
        fleetP2[x][y]='C';
        fleetP2[x][y+1]='C';
        fleetP2[x][y+2]='C';
        fleetP2[x][y+3]='C';
        fleetP2[x][y+4]='C';
    } else {
        fleetP2[x][y]='C';
        fleetP2[x][y-1]='C';
        fleetP2[x][y-2]='C';
        fleetP2[x][y-3]='C';
        fleetP2[x][y-4]='C';
        
    }
    
    while (fleetP2[x][y]!=0) {
        x = arc4random() % 10;
        y = arc4random() % 10;
    }
    
    // size 4
    if(y+3<10){
        fleetP2[x][y]='B';
        fleetP2[x][y+1]='B';
        fleetP2[x][y+2]='B';
        fleetP2[x][y+3]='B';
    } else {
        fleetP2[x][y]='B';
        fleetP2[x][y-1]='B';
        fleetP2[x][y-2]='B';
        fleetP2[x][y-3]='B';
        
    }
    
    while (fleetP2[x][y]!=0) {
        x = arc4random() % 10;
        y = arc4random() % 10;
    }
    
    // size 3
    if(y+3<10){
        fleetP2[x][y]='S';
        fleetP2[x][y+1]='S';
        fleetP2[x][y+2]='S';
        
    } else {
        fleetP2[x][y]='S';
        fleetP2[x][y-1]='S';
        fleetP2[x][y-2]='S';
    }
    while (fleetP2[x][y]!=0) {
        x = arc4random() % 10;
        y = arc4random() % 10;
    }
    
    // size 3
    if(y+3<10){
        fleetP2[x][y]='D';
        fleetP2[x][y+1]='D';
        fleetP2[x][y+2]='D';
        
    } else {
        fleetP2[x][y]='D';
        fleetP2[x][y-1]='D';
        fleetP2[x][y-2]='D';
    }
    
    while (fleetP2[x][y]!=0) {
        x = arc4random() % 10;
        y = arc4random() % 10;
    }
    
    // size 2
    if(y+3<10){
        fleetP2[x][y]='P';
        fleetP2[x][y+1]='P';
        
    } else {
        fleetP2[x][y]='P';
        fleetP2[x][y-1]='P';
    }
    
    UIImage *img;
    
    // CONFIGURE UPPER GRID WITH PLAYER 2 INFO
    for (UIImageView *i in targetImages2) {
        i.hidden = FALSE;
        for (UIImageView *ship in shipImages2) {
            ship.hidden = FALSE;
            [self.view insertSubview:i aboveSubview:ship];
        }
        
        
    }
    [self.view sendSubviewToBack: self.playerGrid];
    
    
    // CONFIGURE LOWER GRID FOR PLAYER 2 WITH PLAYER 1 INFO
    if(fleetP1[x][y]=='X'){
        img = [UIImage imageNamed:@"fire.png"];
        
    } else
        if(fleetP1[x][y]=='O'){
            img = [UIImage imageNamed:@"x.png"];
        } else img = nil;
    
    


}// END OF AUTOPLAY


@end
