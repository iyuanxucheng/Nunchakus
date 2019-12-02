//
//  NKMultiple.h
//  Nunchakus
//
//  Created by WangYajun on 2019/11/29.
//

#import <Foundation/Foundation.h>
#import "NKLayoutEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface NKMultiple : NSObject

@property (nonatomic, assign, readonly) CGFloat valueOfRatio;
@property (nonatomic, assign, readonly) NKLayoutMarginAttribute attribute;
@property (nonatomic, assign, readonly) NKLayoutAttributePriority priorityOfAttribute;

@property (nonatomic, strong) NKMultiple *(^valueOf)(CGFloat ratio);
@property (nonatomic, strong) NKMultiple *(^priorityOf)(NKLayoutAttributePriority priority);

- (instancetype)initWithAttribute:(NKLayoutMarginAttribute)attribute;

@end

NS_ASSUME_NONNULL_END
