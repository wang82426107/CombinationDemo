//
//  ViewController.m
//  Demo
//
//  Created by bnqc on 2019/6/17.
//  Copyright © 2019年 Dong. All rights reserved.
//

#import "ViewController.h"
#import "ColorView.h"
@interface ViewController ()

@property(nonatomic,assign)ColorViewStyle needChangeColorStyle;
@property(nonatomic,strong)NSMutableArray <ColorView *>*colorViews;//Demo简便使用,正常环境需遍历subViews

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat distance = 20;
    CGFloat viewWidth = (width - distance *5)/4.0;
    self.colorViews = [NSMutableArray arrayWithCapacity:4];
    
    //创建ColorView
    for (int i = 0; i < 4; i++) {
        
        ColorView *colorView = [[ColorView alloc] initWithFrame:CGRectMake(viewWidth * i + distance *(i+1), 100, viewWidth, 100)];
        colorView.backgroundColor = [UIColor orangeColor];
        
        switch (i) {
            case 0:
                colorView.title = @"视图A";
                colorView.style = ColorViewStyleA;
                break;
            case 1:
                colorView.title = @"视图B";
                colorView.style = ColorViewStyleB;
                break;
            case 2:
                colorView.title = @"视图C";
                colorView.style = ColorViewStyleC;
                break;
            case 3:
                colorView.title = @"视图D";
                colorView.style = ColorViewStyleD;
                break;
        }
        [self.view addSubview:colorView];
        [self.colorViews addObject:colorView];
    }

    //创建按钮
    for (int i = 0; i < 4; i++) {
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(viewWidth * i + distance *(i+1), 300, viewWidth, 100)];
        button.backgroundColor = [UIColor lightGrayColor];
        button.tag = i + 10000;
        [button setTitle:[NSString stringWithFormat:@"按钮 %d",i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];

    }
}

- (void)buttonAction:(UIButton *)sender {
    
    //对 needChangeColorStyle 进行赋值,其实这步操作应该在一开始做的,这里是Demo,所以这么做了.
    //赋值过程中使用了按位或运算符.整合可响应的View类型.
    NSInteger tagIndex = sender.tag - 10000;
    switch (tagIndex) {
        case 0:
            _needChangeColorStyle = ColorViewStyleA|ColorViewStyleB|ColorViewStyleD;
            break;
        case 1:
            _needChangeColorStyle = ColorViewStyleB|ColorViewStyleC|ColorViewStyleD;
            break;
        case 2:
            _needChangeColorStyle = ColorViewStyleA|ColorViewStyleB;
            break;
        case 3:
            _needChangeColorStyle = ColorViewStyleD;
            break;
    }
    [self colorViewsChangAction];
}

- (void)colorViewsChangAction {
    
    //遍历ColorView视图数组
    for (ColorView *colorView in self.colorViews) {
        //使用了按位与,查看两者是否具有相交部分.
        if (_needChangeColorStyle & colorView.style) {
            NSLog(@"%@ 做出了响应",colorView.title);
            colorView.backgroundColor = [UIColor redColor];
        } else {
            colorView.backgroundColor = [UIColor orangeColor];
        }
    }
}

@end
