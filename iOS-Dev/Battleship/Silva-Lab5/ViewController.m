//
//  ViewController.m
//  Silva-Lab5
//
//  Created by Labuser on 4/1/13.
//  Copyright (c) 2013 WUSTL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    appDelegate = [[UIApplication sharedApplication] delegate];
     
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setPlayMode:(id)sender {
    if(switchPlayMode.on){
        pname2.hidden = TRUE;
        appDelegate->twoPlayers = FALSE;
    }else{
        pname2.hidden = FALSE;
        appDelegate->twoPlayers = TRUE;
    }
}

- (IBAction)endEditing:(id)sender{
    
    // Closes the keyboard
    [sender resignFirstResponder];
    // Saves textbox values
    if(![pname1.text isEqual:@""])
        appDelegate.pname1 = pname1.text;
    else appDelegate.pname1 = @"Player 1";
    if(![pname2.text isEqual:@""])
        appDelegate.pname2 = pname2.text;
    else appDelegate.pname2 = @"Player 2";

}

- (IBAction)saveConfigAndPlay:(id)sender {
    // Saves textbox values
    if(![pname1.text isEqual:@""])
        appDelegate.pname1 = pname1.text;
    else appDelegate.pname1 = @"Player 1";
    if(![pname2.text isEqual:@""])
        appDelegate.pname2 = pname2.text;
    else appDelegate.pname2 = @"Player 2";
    appDelegate->turn = arc4random() % 2 +1; // RANDOM FIRST PLAYER
    if(switchPlayMode.on){
        appDelegate->twoPlayers = FALSE;
    }else{
        appDelegate->twoPlayers = TRUE;
    }
}






@end
