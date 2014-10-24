//
//  ImageViewViewController.h
//  Silva-Lab5
//
//  Created by Labuser on 4/1/13.
//  Copyright (c) 2013 WUSTL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


AppDelegate *appDelegate;

@interface ImageViewViewController : UIViewController <UIAlertViewDelegate>{
    NSMutableArray *shipImages;
    NSMutableArray *bombs;
    NSMutableArray *shipImages1;
    NSMutableArray *shipImages2;
    NSMutableArray *targetImages1;
    NSMutableArray *targetImages2;

    //NSMutableDictionary *shipVertical;
    
    
    @public
    
    // P -> PT Boat Size 2
    // D -> Destroyer Size 3
    // S -> Submarine Size 3
    // B -> Battleship Size 4
    // C -> Carrier Size 5
    
    // X -> Got target / ship portion destroyed
    // O -> Lost target / Exploded on the sea
    char lifeP1[17];
    char lifeP2[17];
    
    char fleetP1[10][10];
    char fleetP2[10][10];
    
    float coordX[10];
    float coordY[10];
    BOOL fireBomb;
    int numBombsP1;
    int numBombsP2;
    
    int numShipsP1;
    int numShipsP2;
    
    BOOL readyFleet1;
    BOOL readyFleet2;
    
    int shipP1P;
    int shipP2P;
    int shipP1D;
    int shipP2D;
    int shipP1S;
    int shipP2S;
    int shipP1B;
    int shipP2B;
    int shipP1C;
    int shipP2C;

    BOOL shipVertical[10];
    BOOL overlaps;
    
}


//@property (nonatomic, retain) NSMutableDictionary *shipVertical;

@property (weak, nonatomic) IBOutlet UIImageView *imgBoat;
@property (weak, nonatomic) IBOutlet UIImageView *imgDestroyer;
@property (weak, nonatomic) IBOutlet UIImageView *imgSubmarine;
@property (weak, nonatomic) IBOutlet UIImageView *imgBattleship;
@property (weak, nonatomic) IBOutlet UIImageView *imgCarrier;


@property (nonatomic, retain) NSMutableArray *shipImages1;
@property (nonatomic, retain) NSMutableArray *shipImages2;
@property (nonatomic, retain) NSMutableArray *targetImages1;
@property (nonatomic, retain) NSMutableArray *targetImages2;
@property (nonatomic, retain) NSMutableArray *bombs;


@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UIButton *turnBtn;

@property (weak, nonatomic) IBOutlet UIButton *fireBtn;
@property (weak, nonatomic) IBOutlet UILabel *labelStatusP1;
@property (weak, nonatomic) IBOutlet UILabel *labelStatusP2;


@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *points;

@property (weak, nonatomic) IBOutlet UILabel *player1NameLabel;

@property (weak, nonatomic) IBOutlet UILabel *player2NameLabel;

@property (weak, nonatomic) IBOutlet UIImageView *fireView;

@property (weak, nonatomic) IBOutlet UIImageView *enemyGrid;
@property (weak, nonatomic) IBOutlet UIImageView *playerGrid;


- (IBAction)saveGrid:(id)sender;

- (IBAction)fire:(id)sender;

- (IBAction)setBomb:(id)sender;

- (IBAction)finishTurn:(id)sender;

- (void) checkWinner;
@end
