//
//  KeyBoardSender.h
//  KeyBoardManager
//
//  Created by 惠上科技 on 2018/9/14.
//  Copyright © 2018年 惠上科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KeyBoardSenderProtocol <NSObject>

/// 与键盘之间的距离 默认为10
@property (nonatomic, assign) CGFloat KeyBoardDistance;

/// 需要做移动的view 默认为当前显示器的view
@property (nonatomic, weak) UIView *MoveView;

@end

@interface UITextField (KeyBoardSender)<KeyBoardSenderProtocol>

@end

@interface UITextView (KeyBoardSender)<KeyBoardSenderProtocol>

@end
