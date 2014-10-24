//
//  ViewController.h
//  Silva-Lab5
//
//  Created by Labuser on 4/1/13.
//  Copyright (c) 2013 WUSTL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

AppDelegate *appDelegate;

@interface ViewController : UIViewController{
   
    IBOutlet UISwitch *switchPlayMode;
    IBOutlet UITextField  *pname1;
    IBOutlet UITextField  *pname2;
    
}

    

- (IBAction)setPlayMode:(id)sender;

- (IBAction)endEditing:(id)sender;

- (IBAction)saveConfigAndPlay:(id)sender;



@end
