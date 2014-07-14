//
//  FloatingTextView.m
//  TestProj
//
//  Created by Siddhant Dange on 1/16/14.
//  Copyright (c) 2014 Siddhant Dange. All rights reserved.
//

#import "FloatingTextView.h"
@import QuartzCore;

@interface FloatingTextView ()

@property (nonatomic, strong) UILabel *placeholderLabel;
@property (nonatomic, strong) NSString *placeholderStr;

@end

@implementation FloatingTextView

-(id)initWithFrame:(CGRect)frame andPlaceholder:(NSString*)placeholder withPointSize:(float)pointSize{
    
    self = [self initWithFrame:frame];
    
    self.placeholderStr = placeholder;
    [self.placeholderLabel setText:placeholder];
    [self.placeholderLabel setFont:[self.placeholderLabel.font fontWithSize:pointSize]];
    [self.placeholderLabel setTextColor:[UIColor lightGrayColor]];
    [self setFont:self.placeholderLabel.font];
    
    
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialization code
        CGRect myFrame = self.frame;
        myFrame.size.height *= 0.8f;
        myFrame.size.width *= 0.8f;
        myFrame.origin = CGPointMake(5.0f, (self.frame.size. height - myFrame.size.height)/2.0);
        self.placeholderLabel = [[UILabel alloc] initWithFrame:myFrame];
        [self addSubview:self.placeholderLabel];
        
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 1.0f;
        [self setDelegate:self];
        
        self.textContainerInset =  UIEdgeInsetsMake(20.0f, 0.0f, 0.0f, 0.0f);
    }
    
    return self;
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    
    //move placeholder textview
    [UIView animateWithDuration:0.2f animations:^{
        CGRect pLFrame = self.placeholderLabel.frame;
        pLFrame.origin = (CGPoint){.x = 5.0f, .y = 5.0f};
        pLFrame.size.height = 15.0f;
        [self.placeholderLabel setFrame:pLFrame];
        [self.placeholderLabel setFont:[self.placeholderLabel.font fontWithSize:10.0f]];
    } completion:^(BOOL finished) {
        
    }];
    
    return YES;
}

//-(void)setPlaceholderStr:(NSString *)placeholderStr{
//    self.placeholderStr = placeholderStr;
//    [self.placeholderLabel setText:self.placeholderStr];
//}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
