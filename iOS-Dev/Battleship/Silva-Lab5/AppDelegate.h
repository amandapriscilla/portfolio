//
//  AppDelegate.h
//  Silva-Lab5
//
//  Created by Labuser on 4/1/13.
//  Copyright (c) 2013 WUSTL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyPoint.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    
    NSString *pname1;
    NSString *pname2;
    
    NSMutableArray *shipPointsP1; //Location + char with the type of the ship for player 1
    NSMutableArray *shipPointsP2; // Same for Player 2



    @public
    BOOL twoPlayers; // 1 or 2
    int turn; // Player 1: turn = 1 / Player 2: turn = 2

    
    // this will
    
    
}

@property (strong, nonatomic) UIWindow *window;


@property (nonatomic, retain) NSString *pname1;

@property (nonatomic, retain) NSString *pname2;

@property (nonatomic, retain) NSMutableArray *shipPointsP1;
@property (nonatomic, retain) NSMutableArray *shipPointsP2;




@end
