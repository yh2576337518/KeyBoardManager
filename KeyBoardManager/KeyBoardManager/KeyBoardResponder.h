//
//  KeyBoardResponder.h
//  KeyBoardManager
//
//  Created by 惠上科技 on 2018/9/14.
//  Copyright © 2018年 惠上科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KeyBoardSender.h"
@interface KeyBoardResponder : NSObject

/**
 记录文本框
 */
@property (nonatomic, weak) UIView<KeyBoardSenderProtocol>*view;

/**
 记录文本框原有的位置
 */
@property (nonatomic, assign, readonly) CGRect frame;

/**
 记录scrollerView原有的contentInset
 */
@property (nonatomic, assign, readonly) UIEdgeInsets contentInset;

/**
 记录scrollView原有的contentOffset
 */
@property (nonatomic, assign, readonly) CGPoint contentOffset;

/**
 保存view原有的tranform
 */
@property (nonatomic, assign, readonly) CGAffineTransform transform;

/**
 获取当前的移动视图是不是scrollerView
 */
@property (nonatomic, assign, readonly) BOOL isScrollMoveView;

/**
 判断当前文本框是不是textView
 */
@property (nonatomic, assign, readonly) BOOL isTextView;

/**
 是不是在tableViewController中
 */
@property (nonatomic, assign, readonly) BOOL inTableViewController;

#pragma mark ----method
/**
 处理键盘弹出
 */
-(void)keyboardShow:(NSTimeInterval)durantion offset:(CGFloat)offset;

/**
 处理键盘关闭
 */
-(void)keyboardHidden:(NSTimeInterval)duration;

@end
