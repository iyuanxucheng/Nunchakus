//
//  NKMargin.h
//  Nunchakus
//
//  Created by WangYajun on 2019/11/29.
//

#import <Foundation/Foundation.h>
#import "NKLayoutEnum.h"

NS_ASSUME_NONNULL_BEGIN

@class NKMultiple;

@interface NKMargin : NSObject

/// 是否是弹性的 自动适配屏幕宽度
@property (nonatomic, assign, readonly) BOOL isStretched;
@property (nonatomic, assign, readonly) CGFloat valueOfOffset;
@property (nonatomic, assign, readonly) NKLayoutAttribute attribute;
@property (nonatomic, assign, readonly) NKLayoutAttributePriority priorityOfAttribute;

@property (nonatomic, strong, readonly) NKMultiple *multipleOfAttribute;

@property (nonatomic, strong) NKMargin *(^stretch)(void);
@property (nonatomic, strong) NKMargin *(^valueOf)(CGFloat offset);
@property (nonatomic, strong) NKMargin *(^priorityOf)(NKLayoutAttributePriority priority);
@property (nonatomic, strong) NKMultiple *(^multipleOf)(NKLayoutAttribute attribute);


- (instancetype)initWithAttribute:(NKLayoutAttribute)attribute;

@end

NS_ASSUME_NONNULL_END

