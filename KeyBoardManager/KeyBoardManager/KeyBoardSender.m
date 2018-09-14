//
//  KeyBoardSender.m
//  KeyBoardManager
//
//  Created by 惠上科技 on 2018/9/14.
//  Copyright © 2018年 惠上科技. All rights reserved.
//

#import "KeyBoardSender.h"
#import "KeyBoardManager.h"
#import <objc/runtime.h>

@implementation UITextField (KeyBoardSender)

- (void)setMoveView:(UIView *)MoveView
{
    if (self.MoveView == MoveView) {
        return;
    }
    
    // 添加关联对象
    objc_setAssociatedObject(self, @selector(MoveView), MoveView, OBJC_ASSOCIATION_ASSIGN);
    
    [self addTarget:[KeyBoardManager sharedManager] action:NSSelectorFromString(@"controlBeginEditing:") forControlEvents:UIControlEventEditingDidBegin];
}

- (UIView *)MoveView
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setKeyBoardDistance:(CGFloat)KeyBoardDistance
{
    objc_setAssociatedObject(self, @selector(KeyBoardDistance), @(KeyBoardDistance), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)KeyBoardDistance
{
    id n = objc_getAssociatedObject(self, _cmd);
    return n?[n floatValue]:10.0;
}

@end

@implementation UITextView (KeyBoardSender)


+ (void)initialize
{
    static dispatch_once_t onceTocken;
    dispatch_once(&onceTocken, ^{
        Method sm = class_getInstanceMethod(self, @selector(canBecomeFirstResponder));
        Method mm = class_getInstanceMethod(self, @selector(YH_canBecomeFirstResponder));
        method_exchangeImplementations(sm, mm);
    });
}

- (BOOL)YH_canBecomeFirstResponder
{
    BOOL result = [self YH_canBecomeFirstResponder];
    if (result && self.MoveView) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [[KeyBoardManager sharedManager] performSelector:NSSelectorFromString(@"controlBeginEditing:") withObject:self];
#pragma clang diagnostic pop
    }
    return result;
}

#pragma mark - property

- (void)setKeyBoardDistance:(CGFloat)KeyBoardDistance
{
    objc_setAssociatedObject(self, @selector(KeyBoardDistance), @(KeyBoardDistance), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)KeyBoardDistance
{
    id n = objc_getAssociatedObject(self, _cmd);
    return n?[n floatValue]:10.0;
}

- (void)setMoveView:(UIView *)MoveView
{
    if (self.MoveView == MoveView){
        return;
    }
    objc_setAssociatedObject(self, @selector(MoveView), MoveView, OBJC_ASSOCIATION_ASSIGN);
}

- (UIView *)MoveView
{
    return objc_getAssociatedObject(self, _cmd);
}
@end
