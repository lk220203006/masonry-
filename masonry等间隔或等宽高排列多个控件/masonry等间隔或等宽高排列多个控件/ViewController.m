//
//  ViewController.m
//  masonry等间隔或等宽高排列多个控件
//
//  Created by digitalforest on 2018/3/13.
//  Copyright © 2018年 liukun. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *masonryViewArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _masonryViewArray = [NSMutableArray array];
    for (int i = 0; i<4; i++) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor redColor];
        view.frame = CGRectMake(0, 0, 80, 80);
        [self.view addSubview:view];
        [_masonryViewArray addObject:view];
    }
    [self test_masonry_vertical_fixItemWidth];
    [self.view updateConstraintsIfNeeded];
}

//- (NSMutableArray *)masonryViewArray{
//    if (!_masonryViewArray) {
//        _masonryViewArray = [NSMutableArray array];
//        for (int i = 0; i<4; i++) {
//            UIView *view = [[UIView alloc] init];
//            view.backgroundColor = [UIColor redColor];
//            [self.view addSubview:view];
//            [_masonryViewArray addObject:view];
//        }
//    }
//    return _masonryViewArray;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test_masonry_horizontal_fixSpace{
    //实现masonry水平固定间隔方法
    [self.masonryViewArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:30 leadSpacing:10 tailSpacing:10];
    //设置array的垂直方向的约束
    [self.masonryViewArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(150);
        make.height.equalTo(80);
    }];
}

- (void)test_masonry_horizontal_fixItemWidth{
    //实现masonry水平固定空间宽度方法
    [self.masonryViewArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:80 leadSpacing:10 tailSpacing:10];
    //设置array的垂直方向的约束
    [self.masonryViewArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(150);
        make.height.equalTo(80);
    }];
}

- (void)test_masonry_vertical_fixSpace{
    //实现masonry垂直固定控件高度方法
    [self.masonryViewArray mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:30 leadSpacing:10 tailSpacing:10];
    //设置array的水平方向的约束
    [self.masonryViewArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(150);
        make.width.equalTo(80);
    }];
}

- (void)test_masonry_vertical_fixItemWidth{
    //实现masonry垂直固定控件高度方法
    [self.masonryViewArray mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedItemLength:80 leadSpacing:10 tailSpacing:10];
    //设置array的水平方向的约束
    [self.masonryViewArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(150);
        make.width.equalTo(80);
    }];
}

@end
