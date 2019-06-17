//
//  ColorView.h
//  Demo
//
//  Created by bnqc on 2019/6/17.
//  Copyright © 2019年 Dong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ColorViewStyleA     = 1<<0,
    ColorViewStyleB     = 1<<1,
    ColorViewStyleC     = 1<<2,
    ColorViewStyleD     = 1<<3,
} ColorViewStyle;

@interface ColorView : UIView

@property(nonatomic,assign)ColorViewStyle style;
@property(nonatomic,copy)NSString *title;

@end


