//
//  KeyBoardResponder.m
//  KeyBoardManager
//
//  Created by 惠上科技 on 2018/9/14.
//  Copyright © 2018年 惠上科技. All rights reserved.
//

#import "KeyBoardResponder.h"

@implementation KeyBoardResponder
-(void)setView:(UIView<KeyBoardSenderProtocol> *)view{
    //清空
    if (view == nil) {
        _frame = CGRectZero;
        _isTextView = NO;
        _isScrollMoveView = NO;
        _contentInset = UIEdgeInsetsZero;
        _transform = CGAffineTransformIdentity;
        _inTableViewController = NO;
        _view = nil;
        return;
    }
    _inTableViewController = [self inTableViewController:view];
    _isScrollMoveView = [view.MoveView isKindOfClass:[UIScrollView class]];
    _isTextView = [view isKindOfClass:[UITextView class]];
    _frame = [view convertRect:view.bounds toView:[UIApplication sharedApplication].keyWindow];
    
    //如果是相同的移动视图 不需要更新transform和偏移值
    if (view.MoveView == _view.MoveView) {
        _view = view;
        return;
    }
    _view = view;
    if (_isScrollMoveView) {
        _contentInset = ((UIScrollView *)view.MoveView).contentInset;
        _contentOffset = ((UIScrollView *)view.MoveView).contentOffset;
        _transform = CGAffineTransformIdentity;
    }else{
        _contentInset = UIEdgeInsetsZero;
        _contentOffset = CGPointZero;
        _transform = view.transform;
    }
}

-(void)keyboardShow:(NSTimeInterval)durantion offset:(CGFloat)offset{
    //如果是scrollerView
    if (self.isScrollMoveView) {
        UIScrollView *moveV = (UIScrollView *)self.view.MoveView;
        [UIView animateWithDuration:durantion animations:^{
            moveV.contentInset = UIEdgeInsetsMake(self.contentInset.top, self.contentInset.left, self.contentInset.bottom + offset, self.contentInset.right);
            moveV.contentOffset = CGPointMake(self.contentOffset.x, self.contentOffset.y + offset);
        }];
    }else{
        [UIView animateWithDuration:durantion animations:^{
            self.view.MoveView.transform = CGAffineTransformTranslate(self.transform, 0, -(offset));
        }];
    }
}

-(void)keyboardHidden:(NSTimeInterval)duration{
    if (self.isScrollMoveView) {
        UIScrollView *moveV = (UIScrollView *)self.view.MoveView;
        [UIView animateWithDuration:duration animations:^{
            moveV.contentInset = self.contentInset;
            moveV.contentOffset = self.contentOffset;
        } completion:^(BOOL finished) {
            self.view = nil;
        }];
    }else{
        [UIView animateWithDuration:duration animations:^{
            self.view.MoveView.transform = self.transform;
        } completion:^(BOOL finished) {
            self.view = nil;
        }];
    }
}

-(BOOL)inTableViewController:(UIView *)view{
    return nil;
}
@end
