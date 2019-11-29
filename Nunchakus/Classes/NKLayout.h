//
// Created by WangYajun on 2019/11/29.
//

#import <Foundation/Foundation.h>

@class NKMargin, NKPadding;

@interface NKLayout : NSObject

@property (nonatomic, weak, readonly) UIView *context;

/// 布局优先级 margin > padding
/// 单一布局 margin padding 二选其一
/// 外边距
@property (nonatomic, strong, readonly) NKMargin *leading;
@property (nonatomic, strong, readonly) NKMargin *top;
@property (nonatomic, strong, readonly) NKMargin *trailing;
@property (nonatomic, strong, readonly) NKMargin *bottom;

@property (nonatomic, strong, readonly) NKMargin *width;
@property (nonatomic, strong, readonly) NKMargin *height;
@property (nonatomic, strong, readonly) NKMargin *centerX;
@property (nonatomic, strong, readonly) NKMargin *centerY;

/// 内边距
@property (nonatomic, strong) NKPadding *padding;

- (instancetype)initWithContext:(UIView *)context;

@end
