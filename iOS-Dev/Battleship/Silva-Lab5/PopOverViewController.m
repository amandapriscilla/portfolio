//
//  PopOverViewController.m
//  Silva-Lab5
//
//  Created by Labuser on 4/2/13.
//  Copyright (c) 2013 WUSTL. All rights reserved.
//

#import "PopOverViewController.h"

@implementation PopOverViewController
@synthesize nextPlayerLabel;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(appDelegate->turn == 2){
        nextPlayerLabel.text = appDelegate.pname2;
    }else{
        nextPlayerLabel.text = appDelegate.pname1;
    }
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
