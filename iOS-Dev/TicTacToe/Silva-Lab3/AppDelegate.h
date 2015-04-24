//
//  AppDelegate.h
//  Silva-Lab3
//
//  Created by Labuser on 2/12/13.
//  Copyright (c) 2013 Labuser. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    NSString *textField1;
    NSString *textField2;
    NSString *namePlayer1;
    NSString *namePlayer2;
@public
    BOOL firstPlayerChosen;
}



@property (nonatomic, retain) NSString *textField1;

@property (nonatomic, retain) NSString *textField2;

@property (nonatomic, retain) NSString *namePlayer1;

@property (nonatomic, retain) NSString *namePlayer2;



@property (strong, nonatomic) UIWindow *window;

@end
