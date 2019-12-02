//
//  NKLayoutEnum.h
//  Nunchakus
//
//  Created by WangYajun on 2019/11/29.
//

#ifndef NKLayoutEnum_h
#define NKLayoutEnum_h

typedef NS_ENUM(NSUInteger, NKLayoutMarginAttribute) {
    NKLayoutAttributeDefault    = 0,
    NKLayoutAttributeLeft       = 1,
    NKLayoutAttributeTop        = 2,
    NKLayoutAttributeRight      = 3,
    NKLayoutAttributeBottom     = 4,
    NKLayoutAttributeCenterX    = 5,
    NKLayoutAttributeCenterY    = 6,
    NKLayoutAttributeWidth      = 7,
    NKLayoutAttributeHeight     = 8,
};

typedef NS_ENUM(NSUInteger, NKLayoutAttributePriority) {

    NKLayoutAttributePriorityLow    = 1000,
    NKLayoutAttributePriorityNormal = 2000,/// default
    NKLayoutAttributePriorityMiddle = 3000,
    NKLayoutAttributePriorityHight  = 4000,
    NKLayoutAttributePriorityDefault = NKLayoutAttributePriorityNormal,
};

typedef NS_ENUM(NSUInteger, NKLayoutEdgeAttribute) {
    NKLayoutAlignmentDefault    = NKLayoutAttributeDefault,
    NKLayoutAlignmentLeft       = NKLayoutAttributeLeft,
    NKLayoutAlignmentTop        = NKLayoutAttributeTop,
    NKLayoutAlignmentRight      = NKLayoutAttributeRight,
    NKLayoutAlignmentBottom     = NKLayoutAttributeBottom,
    NKLayoutAlignmentCenterX    = NKLayoutAttributeCenterX,
    NKLayoutAlignmentCenterY    = NKLayoutAttributeCenterY,
};

#endif /* NKLayoutEnum_h */
