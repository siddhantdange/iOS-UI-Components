//
//  PopupAlert.m
//  Revyt
//
//  Created by Siddhant Dange on 11/11/13.
//  Copyright (c) 2013 Siddhant Dange. All rights reserved.
//

#import "PopupAlert.h"
#import <QuartzCore/QuartzCore.h>

@interface PopupAlert ()

@property (nonatomic, copy) void (^completionBlock)(void);
@property (nonatomic, strong) NSString *message;
@property (nonatomic, assign) float height, width, time;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation PopupAlert

- (id)initWithTime:(float)time message:(NSString*)message completionBlock:(void(^)(void))completion{
    CGRect screen = [UIScreen mainScreen].bounds;
    
    float height = 100.0;
  //  float textWidth = [message sizeWithAttributes:@{NSFontAttributeName : [UIFont fontWithName: @"Lucida Grande" size: 13]}].width;
    float textWidth = 200.0;
    float horizSpacing = 20.0f;
    float width = (textWidth + 4 * horizSpacing < screen.size.width) ? textWidth : screen.size.width * 0.5;
    self = [self initWithFrame:CGRectMake((screen.size.width - width)/2.0, (screen.size.height - height)/2.0, width, height)];
    
    //init code
    self.height = height;
    self.width = width;
    self.time = time;
    self.message = message;
    self.completionBlock = completion;
    
    //UI
    self.layer.cornerRadius = 20.0f;
    [self setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.9]];
    [self setAlpha:0.0];
    
    /*message*/
    
    //positioning
    float spacing = 10.0;
    float textBoxHeight = 80.0;
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(spacing, (self.frame.size.    height - textBoxHeight)/2.0, (self.frame.size.width - 2 * spacing), textBoxHeight)];
    
    //other
    [textField setUserInteractionEnabled:NO];
    
    //text UI
    [textField setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:20.0f]];
    [textField setTextColor:[UIColor whiteColor]];
    [textField setTextAlignment:NSTextAlignmentCenter];
    [textField setText:message];
    
    [self addSubview:textField];
    
    
    return self;
}

-(void)show{
    
    [[UIApplication sharedApplication].windows[0] addSubview:self];
   // [[[UIApplication sharedApplication] keyWindow] addSubview:self];
   // [[[UIApplication sharedApplication] keyWindow] makeKeyAndVisible];
    
    [UIView animateWithDuration:0.2 animations:^{
        [self setAlpha:0.9];
    } completion:^(BOOL finished) {
        [self performSelector:@selector(removeSelf:) withObject:self afterDelay:self.time];
    }];
}

-(void)removeSelf:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        [self setAlpha:0.0];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        if(self.completionBlock){
            self.completionBlock();
        }
    }];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
