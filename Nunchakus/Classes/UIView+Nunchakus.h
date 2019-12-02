//
//  UIView+Nunchakus.h
//  Nunchakus
//
//  Created by WangYajun on 2019/11/29.
//


#import <UIKit/UIKit.h>
#import "NKLayout.h"
#import "NKLayoutEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Nunchakus)

@property (nonatomic, assign, readonly) NKLayoutEdgeAttribute layout_left;
@property (nonatomic, assign, readonly) NKLayoutEdgeAttribute layout_top;
@property (nonatomic, assign, readonly) NKLayoutEdgeAttribute layout_right;
@property (nonatomic, assign, readonly) NKLayoutEdgeAttribute layout_bottom;
@property (nonatomic, assign, readonly) NKLayoutEdgeAttribute layout_centerX;
@property (nonatomic, assign, readonly) NKLayoutEdgeAttribute layout_centerY;


@property (nonatomic, strong, readonly) NKLayout *layout_dog;

- (void)layout_make:(void(^)(NKLayout *layout))maker;


@end

NS_ASSUME_NONNULL_END
