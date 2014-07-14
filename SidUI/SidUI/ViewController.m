//
//  ViewController.m
//  SidUI
//
//  Created by Siddhant Dange on 1/17/14.
//  Copyright (c) 2014 Siddhant Dange. All rights reserved.
//

#import "ViewController.h"
#import "SidUI.h"
#import "MainScreen.h"
#import "HorizontalTableViewCell.h"

#import "HorizontalTableView.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    HorizontalTableView *tbview = [[HorizontalTableView alloc] initWithCellNibNames:@[@"HorizontalTableViewCell"] andFrame:CGRectMake(100.0f, 0.0f, self.view.frame.size.width - 50.0f, 3.0f)];
    tbview.dataSource = self;
    
    [self.view addSubview:tbview];
//    CGRect screen = [UIScreen mainScreen].bounds;
//    
//    //FloatingTextView
//    FloatingTextView *floatingTextView = [[FloatingTextView alloc] initWithFrame:CGRectMake(5.0f, 50.0f, screen.size.width * 0.8f, 40.0f) andPlaceholder:@"hint here!" withPointSize:15.0f];
//    [self.scrollView addSubview:floatingTextView];
//    
//    //PopupAlertUI
//    CGRect paRect = floatingTextView.frame;
//    paRect.origin.y += 50.0f;
//    paRect.size.width = 100.0f;
//    UIButton *popupAlertButton = [[UIButton alloc] initWithFrame:paRect];
//    [popupAlertButton setTitle:@"PopupAlert" forState:UIControlStateNormal];
//    [popupAlertButton addTarget:self action:@selector(popupButtonPressed:) forControlEvents: UIControlEventTouchUpInside];
//    [popupAlertButton setBackgroundColor:[UIColor lightGrayColor]];
//    [popupAlertButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [self.view addSubview:popupAlertButton];
//    
//    MainScreen *ms = [[MainScreen alloc] init];
//     [self.navigationController pushViewController:ms animated:YES];
}

-(void)viewDidAppear:(BOOL)animated{
    
}
#pragma -mark UITableViewDelegate Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    int numRows = 15;
    return numRows;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Identifier for retrieving reusable cells.
    static NSString *cellIdentifier = @"HorizontalTableViewCell";
    
    // Attempt to request the reusable cell.
    HorizontalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // No cell available - create one.
    if(cell == nil) {
        cell = [[HorizontalTableViewCell alloc] init];
    }
    
    return cell;
}

-(void)popupButtonPressed:(id)sender{
    PopupAlert *popupAlertUi = [[PopupAlert alloc] initWithTime:1.0f message:@"popup!" completionBlock:   nil];
    [popupAlertUi show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
