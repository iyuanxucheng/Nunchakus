//
//  NKLayoutEnum.h
//  Nunchakus
//
//  Created by WangYajun on 2019/11/29.
//

#ifndef NKLayoutEnum_h
#define NKLayoutEnum_h

typedef NS_ENUM(NSUInteger, NKLayoutMarginAttribute) {
    NKLayoutMarginAttributeLeft       = 1,
    NKLayoutMarginAttributeTop        = 2,
    NKLayoutMarginAttributeRight      = 3,
    NKLayoutMarginAttributeBottom     = 4,
    NKLayoutMarginAttributeCenterX    = 5,
    NKLayoutMarginAttributeCenterY    = 6,
    NKLayoutMarginAttributeWidth      = 7,
    NKLayoutMarginAttributeHeight     = 8,
    NKLayoutMarginAttributeEdge       = 9,
    NKLayoutMarginAttributeDefault    = NKLayoutMarginAttributeLeft,
};

typedef NS_ENUM(NSUInteger, NKLayoutAttributePriority) {

    NKLayoutAttributePriorityLow    = 1000,
    NKLayoutAttributePriorityNormal = 2000,/// default
    NKLayoutAttributePriorityMiddle = 3000,
    NKLayoutAttributePriorityHight  = 4000,
    NKLayoutAttributePriorityDefault = NKLayoutAttributePriorityNormal,
};

typedef NS_ENUM(NSUInteger, NKLayoutEdgeAttribute) {
    NKLayoutAlignmentDefault    = NKLayoutMarginAttributeDefault,
    NKLayoutAlignmentLeft       = NKLayoutMarginAttributeLeft,
    NKLayoutAlignmentTop        = NKLayoutMarginAttributeTop,
    NKLayoutAlignmentRight      = NKLayoutMarginAttributeRight,
    NKLayoutAlignmentBottom     = NKLayoutMarginAttributeBottom,
    NKLayoutAlignmentCenterX    = NKLayoutMarginAttributeCenterX,
    NKLayoutAlignmentCenterY    = NKLayoutMarginAttributeCenterY,
};

typedef NS_ENUM(NSUInteger, NKLayoutRelativeAttribute) {
    /// 空间没有重叠 外间距 大于0 互不接壤
    NKLayoutRelativeTo = 0,
    /// 空间没有重叠 外间距 等于0 地域接壤
    NKLayoutRelativeOn = 1,
    /// 空间有重叠 地域包含
    NKLayoutRelativeIn = 2,
};


#endif /* NKLayoutEnum_h */
