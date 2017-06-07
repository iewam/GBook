//
//  UIImage+Extension.h
//  CustomCornerImage
//
//  Created by caifeng on 2017/2/22.
//  Copyright © 2017年 facaishu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)


/**
 渲染一张纯色图片

 @param renderColor <#renderColor description#>
 @return <#return value description#>
 */
+ (UIImage *)mw_renderImageFormColor:(UIColor *)renderColor;

/**
 异步绘制圆角图片

 @param size imageView的size
 @param fillColor 剪切部分填充颜色
 @param completion 异步绘制通过block返回绘制结果
 */
- (void)mw_cornerImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor completion:(void(^)(UIImage *image))completion;



/**
 异步缩放图片到指定尺寸

 @param newSize 缩放的尺寸
 @param completion 完成的回调
 */
- (void)mw_resizeImageWithSize:(CGSize)newSize completion:(void (^) (UIImage *))completion;



/**
 异步裁剪指定rect的图片

 @param rect 指定裁剪的尺寸
 @param completion 完成异步回调
 */
- (void)mw_clipImageInRect:(CGRect)rect completion:(void (^)(UIImage *))completion;


/**
 异步自适应等比例缩放裁剪图片

 @param size 要裁减的尺寸
 @param completion 完成异步回调
 */
- (void)mw_autoClipImageToSize:(CGSize)size completion:(void (^)(UIImage *))completion;

@end
