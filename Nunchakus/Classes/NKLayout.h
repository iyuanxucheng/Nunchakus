//
// Created by WangYajun on 2019/11/29.
//

#import <Foundation/Foundation.h>

@class NKMargin;

@interface NKLayout : NSObject

@property (nonatomic, weak, readonly) UIView *context;

/// 外边距
@property (nonatomic, strong, readonly) NKMargin *left;
@property (nonatomic, strong, readonly) NKMargin *top;
@property (nonatomic, strong, readonly) NKMargin *right;
@property (nonatomic, strong, readonly) NKMargin *bottom;

@property (nonatomic, strong, readonly) NKMargin *width;
@property (nonatomic, strong, readonly) NKMargin *height;
@property (nonatomic, strong, readonly) NKMargin *centerX;
@property (nonatomic, strong, readonly) NKMargin *centerY;
@property (nonatomic, strong, readonly) NKMargin *edge;

@property (nonatomic, strong, readonly) NKMargin *(^center)(CGFloat x, CGFloat y);
@property (nonatomic, strong, readonly) NKMargin *(^origin)(CGFloat x, CGFloat y);
@property (nonatomic, strong, readonly) NKMargin *(^size)(CGFloat w, CGFloat h);


- (instancetype)initWithContext:(UIView *)context;
- (void)make;

@end
