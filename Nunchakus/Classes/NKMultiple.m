//
//  NKMultiple.m
//  Nunchakus
//
//  Created by WangYajun on 2019/11/29.
//

#import "NKMultiple.h"
#import "NKMacroConstant.h"

@interface NKMultiple ()

@property (nonatomic, assign) CGFloat valueOfRatio;
@property (nonatomic, assign) NKLayoutAttribute attribute;
@property (nonatomic, assign) NKLayoutAttributePriority priorityOfAttribute;

@end

@implementation NKMultiple

#ifdef DEBUG
- (void)dealloc {
    NKLog(@"%s", __PRETTY_FUNCTION__);
}
#endif

- (instancetype)initWithAttribute:(NKLayoutAttribute)attribute {
    self = [super init];
    if (self) {
        _attribute = attribute;
    }
    return self;
}

- (NKMultiple *(^)(CGFloat))valueOf {
    return ^(CGFloat value) {
        self.valueOfRatio = value;
        return self;
    };
}

- (NKMultiple *(^)(NKLayoutAttributePriority))priorityOf {
    return ^(NKLayoutAttributePriority priority) {
        self.priorityOfAttribute = priority;
        return self;
    };
}



@end
