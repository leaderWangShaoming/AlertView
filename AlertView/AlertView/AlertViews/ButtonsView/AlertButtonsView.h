//
//  AlertButtonsView.h
//  AlertView
//
//  Created by my on 16/5/19.
//  Copyright © 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlertViewHead.h"

typedef void(^TapIndex)(NSInteger index);

@interface AlertButtonsView : UICollectionView

/**
 * button布局数组
 * 请使用NSNumber类型
 * 例子：@[1,2,1],用于设置每行显示几个按钮，默认为@[1,1,1...]
 * 按钮设置总数应与数组中值之和相同，不同时，根据情况变化
 */
@property (nonatomic, strong) NSMutableArray *buttonsLayout;
/**
 * buttons数组
 */
@property (nonatomic, strong) NSMutableArray *buttonsArray;

//按钮高度
@property (nonatomic, assign) CGFloat buttonHeight;

//按钮属性
@property (nonatomic, strong) UIColor *buttonColor;
@property (nonatomic, strong) UIFont *buttonFont;
@property (nonatomic, strong) UIFont *bottonBorderWith;

- (void)updateButtonsLayout;

- (instancetype)initWithTypeArray:(NSArray *)typeArr
                     buttonsArray:(NSArray *)buttonArr
                         tapBlock:(TapIndex)block;
@end
