//
//  UIImage+Extension.m
//  CustomCornerImage
//
//  Created by caifeng on 2017/2/22.
//  Copyright © 2017年 facaishu. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (UIImage *)mw_renderImageFormColor:(UIColor *)renderColor {

    CFTimeInterval start = CACurrentMediaTime();
    
    CGRect rect = CGRectMake(0, 0, 300.0, 300.0);
    UIGraphicsBeginImageContext(rect.size);
    [renderColor setFill];
    UIRectFill(rect);
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSLog(@"render time-%f", CACurrentMediaTime() - start);
    return result;
}

- (void)mw_cornerImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor completion:(void (^)(UIImage *))completion {

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
        CFTimeInterval start = CACurrentMediaTime();
        
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        
        [fillColor setFill];
        UIRectFill(rect);
        
        UIBezierPath *clipPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:rect.size.width * 0.5];
        [clipPath addClip];
        
        [self drawInRect:rect];
        UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        NSLog(@"corner time-%f", CACurrentMediaTime() - start);
        
            dispatch_async(dispatch_get_main_queue(), ^{
              
                if (completion != nil) {
                   
                    completion(result);
                }
            });
        
    });
}


- (void)mw_resizeImageWithSize:(CGSize)newSize completion:(void (^) (UIImage *))completion {
    
    
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        
            UIGraphicsBeginImageContext(newSize);
            [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
            UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (completion) {
               
                    completion(result);
                }
            });
            
        });

}


- (void)mw_clipImageInRect:(CGRect)rect completion:(void (^)(UIImage *))completion {
 
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        CGImageRef sourceImageRef = [self CGImage];
        CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, CGRectMake(0, 0, 110, 141));
        
        UIGraphicsBeginImageContext(CGSizeMake(110, 141));

        CGContextRef con = UIGraphicsGetCurrentContext();
        CGContextDrawImage(con, rect, newImageRef);
        UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
       
        UIGraphicsEndPDFContext();
    
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            if (completion) {
                
                completion(resultImage);
            }
        });
        
    });
    
    
}


- (void)mw_autoClipImageToSize:(CGSize)size completion:(void (^)(UIImage *))completion {

    CGSize imageSize = self.size;
    // image 宽高比大于等于指定的size宽高比， 根据image高度来裁减
    CGRect rect;
    if (imageSize.width * size.height >= size.width * imageSize.height) {
        
        CGFloat height = imageSize.height;
        CGFloat width = height * size.width / size.height;
         rect = CGRectMake((imageSize.width - width) * 0.5, 0, width, height);
        
    } else {     // image 宽高比小于指定的size宽高比， 根据image宽度来裁减

        CGFloat width = imageSize.width;
        CGFloat height = width * size.height / size.width;
        rect = CGRectMake(0, (imageSize.height - height) * 0.5, width, height);
        
    }
    [self mw_clipImageInRect:rect completion:completion];
}


@end
