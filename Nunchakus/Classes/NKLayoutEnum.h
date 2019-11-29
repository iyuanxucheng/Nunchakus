//
//  NKLayoutEnum.h
//  Nunchakus
//
//  Created by WangYajun on 2019/11/29.
//

#ifndef NKLayoutEnum_h
#define NKLayoutEnum_h

typedef NS_ENUM(NSUInteger, NKLayoutAttribute) {
    NKLayoutAttributeDefault    = 0,
    NKLayoutAttributeLeft       = 1,
    NKLayoutAttributeTop        = 2,
    NKLayoutAttributeRight      = 3,
    NKLayoutAttributeBottom     = 4,
    NKLayoutAttributeWidth      = 5,
    NKLayoutAttributeHeight     = 6,
    NKLayoutAttributeCenterX    = 7,
    NKLayoutAttributeCenterY    = 8,
};

typedef NS_ENUM(NSUInteger, NKLayoutAttributePriority) {

    NKLayoutAttributePriorityLow    = 1000,
    NKLayoutAttributePriorityNormal = 2000,/// default
    NKLayoutAttributePriorityMiddle = 3000,
    NKLayoutAttributePriorityHight  = 4000,
    NKLayoutAttributePriorityDefault = NKLayoutAttributePriorityNormal,
};

#endif /* NKLayoutEnum_h */
