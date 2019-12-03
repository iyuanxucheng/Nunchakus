//
//  NKMultiple.h
//  Nunchakus
//
//  Created by WangYajun on 2019/11/29.
//

#import <Foundation/Foundation.h>
#import "NKLayoutEnum.h"
@class NKMargin;

NS_ASSUME_NONNULL_BEGIN

@interface NKMultiple : NSObject

@property (nonatomic, assign, readonly) CGFloat valueOfRatio;
@property (nonatomic, assign, readonly) NKLayoutMarginAttribute multipleByAttribute;

@property (nonatomic, strong, readonly) NKMargin *(^ratio)(CGFloat);
/// UIView or NKMargin
@property (nonatomic, strong, readonly) NKMultiple *(^by)(id);

- (instancetype)initWithMargin:(NKMargin *)margin;


@end

NS_ASSUME_NONNULL_END
