//
//  FirstViewController.m
//  iClothes
//
//  Created by Shi Lin on 8/15/13.
//  Copyright (c) 2013 Forrest Shi. All rights reserved.
//

#import "BarcodeScanViewController.h"

@interface BarcodeScanViewController ()

@end

@implementation BarcodeScanViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
