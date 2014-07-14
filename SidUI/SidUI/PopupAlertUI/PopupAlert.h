//
//  PopupAlert.h
//  Revyt
//
//  Created by Siddhant Dange on 11/11/13.
//  Copyright (c) 2013 Siddhant Dange. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopupAlert : UIView

- (id)initWithTime:(float)time message:(NSString*)message completionBlock:(void(^)(void))completion;
-(void)show;


@end
