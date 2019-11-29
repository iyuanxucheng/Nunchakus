//
//  UIView+Nunchakus.h
//  Nunchakus
//
//  Created by WangYajun on 2019/11/29.
//


#import <UIKit/UIKit.h>
#import "NKLayout.h"


NS_ASSUME_NONNULL_BEGIN

@interface UIView (Nunchakus)

@property (nonatomic, strong, readonly) NKLayout *layout_dog;

- (void)layout_make:(void(^)(NKLayout *layout))maker;


@end

NS_ASSUME_NONNULL_END
