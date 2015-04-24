//
//  ViewController.h
//  Silva-Lab3
//
//  Created by Labuser on 2/12/13.
//  Copyright (c) 2013 Labuser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "MyPoint.h"



// ENUMERATOR FOR PLAYERS
typedef enum {
    Random,
    Player1,
    Player2
} Player;

// Global Variables
static BOOL iphonePlays;
static BOOL gameStarted;
static Player firstPlayer;
static char p1;
static char p2;
AppDelegate *appDelegate;



//extern NSString *namePlayer1;
//extern NSString *namePlayer2;

// Interface Variables
@interface ViewController : UIViewController <UIAlertViewDelegate>{
    int numTurns;
    char matrix[3][3];
    BOOL gameOver;

}


// Menu Controls
@property (weak, nonatomic) IBOutlet UIButton *onePlayerBtn;

@property (weak, nonatomic) IBOutlet UITextField *Player1Field;

@property (weak, nonatomic) IBOutlet UITextField *Player2Field;

@property (weak, nonatomic) IBOutlet UIButton *Player1Btn;

@property (weak, nonatomic) IBOutlet UIButton *Player2Btn;

@property (weak, nonatomic) IBOutlet UILabel *Player2Label;

@property (strong, nonatomic) IBOutlet UIButton *PlayGameBtn;

// Game Controls

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;

@property (weak, nonatomic) IBOutlet UIButton *midBtn;

@property (weak, nonatomic) IBOutlet UILabel *currentPlayerLabel;


// Menu Methods


-(IBAction)setPlayMode:(id)sender;

-(IBAction)setFirstPlayer:(id)sender;

- (IBAction)endEditing:(id)sender;

- (IBAction)startGame:(id)sender;

// Game Methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

-(IBAction)playStep:(id)sender;

- (BOOL) checkSquare:(int)square value:(char)turn;

- (int)iPhoneStrategy:(char)p;

- (int)pointToIndex:(MyPoint*)p;

- (void)endGame:(char)winner;


@end
