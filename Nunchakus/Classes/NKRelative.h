//
//  NKRelative.h
//  Nunchakus
//
//  Created by WangYajun on 2019/12/2.
//

#import <Foundation/Foundation.h>
#import "NKLayoutEnum.h"

NS_ASSUME_NONNULL_BEGIN

@class NKMargin;
@interface NKRelative : NSObject

@property (nonatomic, assign, readonly) CGFloat valueOfOffset;
@property (nonatomic, assign, readonly) NKLayoutMarginAttribute relativeAttribute;

@property (nonatomic, strong, readonly) NKRelative *(^to)(id);
@property (nonatomic, strong, readonly) NKRelative *(^on)(id);
@property (nonatomic, strong, readonly) NKRelative *(^in)(id);
@property (nonatomic, strong, readonly) NKMargin *(^valueOf)(CGFloat);

- (instancetype)initWithMargin:(NKMargin *)margin;

@end

NS_ASSUME_NONNULL_END
