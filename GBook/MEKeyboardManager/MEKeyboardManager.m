//
//  MEKeyboardManager.m
//  VideoCompress
//
//  Created by 马伟 on 2017/6/27.
//  Copyright © 2017年 facaishu. All rights reserved.
//

#import "MEKeyboardManager.h"

@implementation MEKeyboardManager

+ (void)registerKeyboardWillShow:(id)target {
    [[NSNotificationCenter defaultCenter] addObserver:target selector:@selector(keyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
}

+ (void)registerKeyboardWillHide:(id)target {
    [[NSNotificationCenter defaultCenter] addObserver:target selector:@selector(keyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
}

+ (CGRect)returnKeyboardViewRect:(NSNotification *)notification {
    CGRect rect;
    [[notification.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &rect];
    return rect;
}

+ (double)returnKeyboardAnimationDuration:(NSNotification *)notification {
    double duration;
    [[notification.userInfo valueForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&duration];
    return duration;
}

+ (UIViewAnimationCurve)returnKeyboardAnimationCurve:(NSNotification *)notification {
    UIViewAnimationCurve animationCurve;
    [[notification.userInfo valueForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    return animationCurve;
}

@end
