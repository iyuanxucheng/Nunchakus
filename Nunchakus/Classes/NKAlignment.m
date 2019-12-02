//
//  NKAlignment.m
//  Nunchakus
//
//  Created by 王亚军 on 2019/12/1.
//

#import "NKAlignment.h"
#import "NKMacroConstant.h"
#import "NKLayoutEnum.h"
#import "NKMargin.h"
#import "UIView+Nunchakus.h"

@interface NKAlignment ()

@property (nonatomic, assign) NKLayoutEdgeAttribute edgeAttribute;

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


- (void (^)(id))with {
    return ^(id attr){
        [self calculateAttribute:attr];
    };
}

- (void)calculateAttribute:(id)attr {
    const char *type = @encode(__typeof__((attr)));
    if (strcmp(type, @encode(unsigned long)) == 0) {

        self.edgeAttribute = (NKLayoutEdgeAttribute)attr;

    } else if (strcmp(type, @encode(id)) == 0) {
        UIView *obj = attr;
        if ([obj isKindOfClass:UIView.class]) {
            self.edgeAttribute = [self defaultAttrbute];
        }
    }
}

- (NKLayoutEdgeAttribute)defaultAttrbute {
    if (NKLayoutAttributeCenterY >= self.margin.attribute) {
        return (NKLayoutEdgeAttribute)self.margin.attribute;
    }
    return NKLayoutAlignmentDefault;
}



@end
