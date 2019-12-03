//
//  NKMultiple.m
//  Nunchakus
//
//  Created by WangYajun on 2019/11/29.
//

#import "NKMultiple.h"
#import "NKMacroConstant.h"
#import "NKMargin.h"

@interface NKMultiple ()

@property (nonatomic, assign) CGFloat valueOfRatio;
@property (nonatomic, assign) NKLayoutMarginAttribute multipleByAttribute;

@property (nonatomic, weak) NKMargin *margin;

@end

@implementation NKMultiple

#ifdef DEBUG
- (void)dealloc {
    NKLog(@"%s", __PRETTY_FUNCTION__);
}
#endif

- (instancetype)initWithMargin:(NKMargin *)margin {
    self = [super init];
    if (self) {
        _margin = margin;
    }
    return self;
}

- (NKMargin *(^)(CGFloat))ratio {
    return ^(CGFloat value) {
        self.valueOfRatio = value;
        return self.margin;
    };
}

- (NKMultiple * (^)(id))by {
    return ^(id attr) {

        NKMargin *obj = attr;
        self.multipleByAttribute = NKLayoutMarginAttributeDefault;

        if ([obj isKindOfClass:NKMargin.class]) {
            self.multipleByAttribute = [self attrbuteWithMargin:obj];
            return self;
        }
        if ([obj isKindOfClass:UIView.class]) {
            self.multipleByAttribute = [self attrbuteWithMargin:self.margin];
            return self;
        }
        NSAssert(NO, @"Alignment type error ...");
        return self;
    };
}

- (NKLayoutMarginAttribute)attrbuteWithMargin:(NKMargin *)margin {
    if (NKLayoutMarginAttributeCenterY >= margin.attribute) {
        return margin.attribute;
    }
    return NKLayoutMarginAttributeDefault;
}

@end
