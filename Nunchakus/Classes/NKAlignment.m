//
//  NKAlignment.m
//  Nunchakus
//
//  Created by 王亚军 on 2019/12/1.
//

#import "NKAlignment.h"
#import "NKMacroConstant.h"
#import "NKMargin.h"
#import "UIView+Nunchakus.h"


// to in on

@interface NKAlignment ()

@property (nonatomic, assign) NKLayoutEdgeAttribute alignmentAttribute;

@property (nonatomic, weak) NKMargin *margin;

@end

@implementation NKAlignment

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


- (NKMargin *(^)(id))with {
    return ^(id attr){
        [self calculateAttribute:attr];
        return self.margin;
    };
}

- (void)calculateAttribute:(id)attr {

    NKMargin *obj = attr;
    _alignmentAttribute = NKLayoutAlignmentDefault;

    if ([obj isKindOfClass:NKMargin.class]) {

        _alignmentAttribute = [self attrbuteWithMargin:obj];
        return;
    }

    if ([obj isKindOfClass:UIView.class]) {

        _alignmentAttribute = [self attrbuteWithMargin:_margin];
        return;
    }

    NSAssert(NO, @"Alignment type error ...");
}

- (NKLayoutEdgeAttribute)attrbuteWithMargin:(NKMargin *)margin {
    if (NKLayoutMarginAttributeCenterY >= margin.attribute) {
        return (NKLayoutEdgeAttribute)margin.attribute;
    }
    return NKLayoutAlignmentDefault;
}



@end
