//
//  MainScreen.m
//  SidUI
//
//  Created by Siddhant Dange on 6/18/14.
//  Copyright (c) 2014 Siddhant Dange. All rights reserved.
//

#import "MainScreen.h"

@interface MainScreen ()

@property (nonatomic, weak) IBOutlet UIButton *nextButton;

@end

@implementation MainScreen

-(id)init{
    self = [super initWithNibName:@"MainScreen" bundle:nil];
    if (self) {
        // Further initialization if needed
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(IBAction)action:(id)sender{
    [self popScreen];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
