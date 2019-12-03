//
//  UIView+Nunchakus.h
//  Nunchakus
//
//  Created by WangYajun on 2019/11/29.
//


#import <UIKit/UIKit.h>
#import "NKLayout.h"
#import "NKLayoutEnum.h"

@class NKMargin;

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Nunchakus)

@property (nonatomic, strong, readonly) NKMargin *nk_left;
@property (nonatomic, strong, readonly) NKMargin *nk_top;
@property (nonatomic, strong, readonly) NKMargin *nk_right;
@property (nonatomic, strong, readonly) NKMargin *nk_bottom;
@property (nonatomic, strong, readonly) NKMargin *nk_width;
@property (nonatomic, strong, readonly) NKMargin *nk_height;
@property (nonatomic, strong, readonly) NKMargin *nk_centerX;
@property (nonatomic, strong, readonly) NKMargin *nk_centerY;
@property (nonatomic, strong, readonly) NKMargin *nk_edge;

- (void)nk_make;
- (void)nk_makeLayout:(void(^)(NKLayout *layout))maker;



@end

NS_ASSUME_NONNULL_END
