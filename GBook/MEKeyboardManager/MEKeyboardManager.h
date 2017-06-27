//
//  MEKeyboardManager.h
//  VideoCompress
//
//  Created by 马伟 on 2017/6/27.
//  Copyright © 2017年 facaishu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MEKeyboardManager : NSObject

+ (void)registerKeyboardWillShow:(id)target;
+ (void)registerKeyboardWillHide:(id)target;
+ (CGRect)returnKeyboardViewRect:(NSNotification *)notification;
+ (double)returnKeyboardAnimationDuration:(NSNotification *)notification;
+ (UIViewAnimationCurve)returnKeyboardAnimationCurve:(NSNotification *)notification;

@end
