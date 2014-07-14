//
//  Screen.h
//  SidUI
//
//  Created by Siddhant Dange on 6/18/14.
//  Copyright (c) 2014 Siddhant Dange. All rights reserved.
//

#import "ViewController.h"

@interface Screen : UIViewController

@property (nonatomic, strong) NSDictionary *passedData;

-(void)goToScreen:(NSString*)screenName animated:(BOOL)animated;
-(void)goToScreen:(NSString *)screenName animated:(BOOL)animated withData:(NSDictionary*)data;
-(void)setup;
-(void)popScreen;

@end
