//
//  NKMargin.m
//  Nunchakus
//
//  Created by WangYajun on 2019/11/29.
//

#import "NKMargin.h"
#import "NKMultiple.h"
#import "NKLayoutEnum.h"
#import "NKMacroConstant.h"

@interface NKMargin ()

@property (nonatomic, assign) BOOL isStretched;
@property (nonatomic, assign) CGFloat valueOfOffset;
@property (nonatomic, assign) NKLayoutAttribute attribute;
@property (nonatomic, assign) NKLayoutAttributePriority priorityOfAttribute;

@property (nonatomic, strong) NKMultiple *multipleOfAttribute;

@end

@implementation NKMargin


#ifdef DEBUG
- (void)dealloc {
    NKLog(@"%s", __PRETTY_FUNCTION__);
}
#endif

- (NSUInteger)hash {
    return _attribute << 16 ^ NSUIntegerMax;
}

- (instancetype)initWithAttribute:(NKLayoutAttribute)attribute {
    if (self) {
        _attribute = attribute;
        _priorityOfAttribute = NKLayoutAttributePriorityDefault;
    }
    return self;
}

- (NKMargin * (^)(void))stretch {
    return ^{
        self.isStretched = YES;
        return self;
    };
}

- (NKMargin *(^)(CGFloat))valueOf {
    return ^(CGFloat value) {
        self.valueOfOffset = value;
        return self;
    };
}

- (NKMargin *(^)(NKLayoutAttributePriority))priorityOf {
    return ^(NKLayoutAttributePriority priority) {
        self.priorityOfAttribute = priority;
        return self;
    };
}

- (NKMultiple *(^)(NKLayoutAttribute))multipleOf {
    return ^(NKLayoutAttribute attribute) {
        NKMultiple *m = [[NKMultiple alloc] initWithAttribute:attribute];
        self.multipleOfAttribute = m;
        return m;
    };
}

@end
