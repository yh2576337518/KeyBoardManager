//
//  KeyBoardManager.h
//  KeyBoardManager
//
//  Created by 惠上科技 on 2018/9/14.
//  Copyright © 2018年 惠上科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyBoardManager : NSObject

/**
 是否可用
 */
@property (nonatomic, assign) BOOL enable;


/**
 单例manager
 */
+(instancetype)sharedManager;

@end
