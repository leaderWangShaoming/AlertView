//
//  ViewController.m
//  AlertView
//
//  Created by my on 16/5/18.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "ViewController.h"
#import "AlertHeadView.h"
#import "AlertButtonsView.h"
#import "UIView+Category.h"


#import "AlertViewShow.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
{
    UITableView *mainTable;
    NSArray *listArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTable];
}

- (void)initTable {
    listArray = @[@"文字",@"图片",@"图文",@"文字头，文字内容",@"头，内容总方法",@"头部，按钮",@"文字提示，内容，按钮",@"终极方法",@"showHint"];
    
    mainTable = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    mainTable.delegate = self;
    mainTable.dataSource = self;
    [self.view addSubview:mainTable];
    
    mainTable.sd_layout.spaceToSuperView(UIEdgeInsetsMake(40, 0, 0, 0));
}

#pragma mark - tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = listArray[indexPath.row];
    cell.textLabel.textColor = [UIColor grayColor];
    cell.selectionStyle = 0;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40.f;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 100;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    //contentView单独使用
    UIView *v = [UIView new];
    v.backgroundColor = [UIColor redColor];
    v.frame = CGRectMake(0, 0, SCREEN_WIDTH, 100);
    //    AlertHeadView *alert = [[AlertHeadView alloc] initWithGraphic:AlertHeadGraphicBottom title:@"提示" imageName:@"1"];
    AlertHeadView *alert = [[AlertHeadView alloc] initWithType:AlertHeadTypeGraphic title:@"提示" image:[UIImage imageNamed:@"1"]];
    [v addSubview:alert];
    alert.MaxImageHeight = 90;
    alert.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    alert.layer.borderWidth = 1;
    alert.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
    [alert updateHeadLayout];
    return v;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIImage *image = [UIImage imageNamed:@"1"];
    switch (indexPath.row) {
        case 0:
        {
            AlertViewShow *alert = [[AlertViewShow alloc] initWithType:AlertHeadTypeCustom title:@"提示提示提示" image:nil];
            [alert show:AlertViewAnimationIncrease offsetY:-200];
        }
            break;
        case 1:
        {
            AlertViewShow *alert = [[AlertViewShow alloc] initWithType:AlertHeadTypeImage title:nil image:image];
            [alert show:AlertViewAnimationReduce];
        }
            break;
        case 2:
        {
            AlertViewShow *alert = [[AlertViewShow alloc] initWithType:AlertHeadTypeGraphic title:@"提示提示提示" image:image];
            [alert show:AlertViewAnimationIncrease];
        }
            break;
        case 3:
        {
            AlertViewShow *alert = [[AlertViewShow alloc] initHeadTitle:@"提示" contentTitle:@"这是我随便打的字我也不知道我打的是什么主要是为了凑字数不知道写点什么但貌似字数差不多了那我就结束吧"];
            alert.contentView.textAlignment = NSTextAlignmentLeft;
            alert.contentView.font = [UIFont systemFontOfSize:13];
            alert.contentView.titleColor = [UIColor grayColor];
            alert.lineHeight = 1;
            [alert show:AlertViewAnimationRight];
        }
            break;
        case 4:
        {
            AlertViewShow *alert = [[AlertViewShow alloc] initHeadType:AlertHeadGraphicCenterLeft headTitle:@"提示" headImage:[UIImage imageNamed:@"alert"] contentType:AlertHeadGraphicTop contentTitle:@"这是我随便打的字我也不知道我打的是什么主要是为了凑字数不知道写点什么但貌似字数差不多了那我就结束吧" contentImage:image];
            alert.headView.MaxImageHeight = 30;
            alert.coverColor = [UIColor colorWithWhite:.7 alpha:.3];
            alert.contentView.textAlignment = NSTextAlignmentLeft;
            alert.contentView.font = [UIFont systemFontOfSize:13];
            alert.contentView.titleColor = [UIColor grayColor];
            alert.contentView.MaxImageHeight = 900;

            alert.lineHeight = 1;
            alert.lineColor = [UIColor greenColor];
            
            [alert show:AlertViewAnimationLeft];
        }
            break;
        case 5:
        {
            __block AlertViewShow *alert = [[AlertViewShow alloc] initWithGraphic:AlertHeadGraphicTop title:@"这是我随便打的字我也不知道我打的是什么主要是为了凑字数不知道写点什么但貌似字数差不多了那我就结束吧" image:[UIImage imageNamed:@"1"] buttonType:@[@(1),@(2),@(1)] buttonsArray:@[@"1",@"2",@"3",@"4"] tapBlock:^(NSInteger index) {
                NSLog(@"点击了第%ld个",index + 1);
            }];
            alert.headView.MaxImageHeight = 999;
            alert.coverColor = [UIColor colorWithWhite:.7 alpha:.3];
            
            alert.contentView.font = [UIFont systemFontOfSize:13];
            alert.contentView.titleColor = [UIColor grayColor];
            
            alert.lineHeight = 1;
            alert.lineColor = [UIColor greenColor];
            
            [alert show:AlertViewAnimationLeft];
        }
            break;
        case 6:
        {
            __block AlertViewShow *alert = [[AlertViewShow alloc] initHeadTitle:@"提示" contentTitle:@"这是我随便打的字我也不知道我打的是什么主要是为了凑字数不知道写点什么但貌似字数差不多了那我就结束吧" buttonType:@[@(2),@(3),@(2)] buttonsArray:@[@"1",@"2",@"3",@"4"] tapBlock:^(NSInteger index) {
                NSLog(@"点击了第%ld个",index + 1);
            }];
            alert.contentView.textAlignment = NSTextAlignmentLeft;
            alert.contentView.font = [UIFont systemFontOfSize:13];
            alert.contentView.titleColor = [UIColor grayColor];
            alert.lineHeight = 1;
            [alert show:AlertViewAnimationLeft];
        }
            break;
        case 7:
        {
            __block AlertViewShow *alert = [[AlertViewShow alloc] initHeadType:AlertHeadGraphicCenterLeft
                                                             headTitle:@"提示"
                                                             headImage:[UIImage imageNamed:@"alert"]
                                                           contentType:AlertHeadGraphicTop
                                                          contentTitle:@"这是我随便打的字我也不知道我打的是什么主要是为了凑字数不知道写点什么但貌似字数差不多了那我就结束吧"
                                                          contentImage:[UIImage imageNamed:@"1"]
                                                            buttonType:@[@(2)]
                                                          buttonsArray:@[@"确定",@"取消"]
                                                              tapBlock:^(NSInteger index) {
                                                                  NSLog(@"点击了第%ld个",index + 1);
                                                                  [alert dismiss];
                                                              }];
            alert.coverColor = [UIColor colorWithWhite:.7 alpha:.3];
            alert.headView.MaxImageHeight = 30;
            
            alert.contentView.textAlignment = NSTextAlignmentLeft;
            alert.contentView.font = [UIFont systemFontOfSize:13];
            alert.contentView.titleColor = [UIColor grayColor];
            alert.contentView.MaxImageHeight = 900;
            
            alert.lineHeight = 1;
            alert.lineColor = [UIColor greenColor];
            [alert show:AlertViewAnimationLeft];
            
            NSLog(@"%@",alert);
        }
            break;
        case 8:
        {
            [AlertHeadView showHint:@"提示信息" offSet:70];
        }
            break;
        default:
            break;
    }
}

@end
