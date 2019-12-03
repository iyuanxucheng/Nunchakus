//
//  NKMargin.h
//  Nunchakus
//
//  Created by WangYajun on 2019/11/29.
//

#import <Foundation/Foundation.h>
#import "NKLayoutEnum.h"
#import "NKMacroConstant.h"

NS_ASSUME_NONNULL_BEGIN


@class NKMultiple, NKAlignment, NKRelative;

@interface NKMargin : NSObject

/// 是否是弹性的 自动适配屏幕宽度
@property (nonatomic, assign, readonly) BOOL isStretched;
@property (nonatomic, assign, readonly) CGFloat valueOfOffset;
@property (nonatomic, assign, readonly) NKLayoutMarginAttribute attribute;
@property (nonatomic, assign, readonly) NKLayoutAttributePriority priorityOfAttribute;

@property (nonatomic, strong, readonly) NKMargin *left;
@property (nonatomic, strong, readonly) NKMargin *top;
@property (nonatomic, strong, readonly) NKMargin *right;
@property (nonatomic, strong, readonly) NKMargin *bottom;
@property (nonatomic, strong, readonly) NKMargin *width;
@property (nonatomic, strong, readonly) NKMargin *height;
@property (nonatomic, strong, readonly) NKMargin *centerX;
@property (nonatomic, strong, readonly) NKMargin *centerY;
@property (nonatomic, strong, readonly) NKMargin *edge;

@property (nonatomic, strong, readonly) NKAlignment *aligned;
@property (nonatomic, strong, readonly) NKMultiple *multiple;
@property (nonatomic, strong, readonly) NKRelative *relative;

@property (nonatomic, strong, readonly) NKMargin *(^stretch)(void);
@property (nonatomic, strong, readonly) NKMargin *(^priority)(NKLayoutAttributePriority);

@property (nonatomic, strong) NKMargin *head;
@property (nonatomic, strong) NKMargin *next;

- (instancetype)initWithAttribute:(NKLayoutMarginAttribute)attribute;

@end

NS_ASSUME_NONNULL_END

