//
//  FloatingTextView.h
//  TestProj
//
//  Created by Siddhant Dange on 1/16/14.
//  Copyright (c) 2014 Siddhant Dange. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FloatingTextView : UITextView <UITextViewDelegate>

-(id)initWithFrame:(CGRect)frame andPlaceholder:(NSString*)placeholder withPointSize:(float)pointSize;       

@end
