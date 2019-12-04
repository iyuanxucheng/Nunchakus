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
#import "NKAlignment.h"
#import "NKRelative.h"

@interface NKMargin ()

@property (nonatomic, assign) BOOL isStretched;
@property (nonatomic, assign) NKLayoutMarginAttribute attribute;
@property (nonatomic, assign) NKLayoutAttributePriority priorityOfAttribute;

@property (nonatomic, assign) CGPoint valueOfCenter;
@property (nonatomic, assign) CGPoint valueOfOrigin;
@property (nonatomic, assign) CGSize valueOfSize;

@property (nonatomic, strong) NKMargin *left;
@property (nonatomic, strong) NKMargin *top;
@property (nonatomic, strong) NKMargin *right;
@property (nonatomic, strong) NKMargin *bottom;
@property (nonatomic, strong) NKMargin *width;
@property (nonatomic, strong) NKMargin *height;
@property (nonatomic, strong) NKMargin *centerX;
@property (nonatomic, strong) NKMargin *centerY;
@property (nonatomic, strong) NKMargin *edge;

@property (nonatomic, strong) NKAlignment *aligned;
@property (nonatomic, strong) NKMultiple *multiple;
@property (nonatomic, strong) NKRelative *relative;

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

- (instancetype)initWithAttribute:(NKLayoutMarginAttribute)attribute {
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

- (NKMargin *(^)(NKLayoutAttributePriority))priority {
    return ^(NKLayoutAttributePriority priority) {
        self.priorityOfAttribute = priority;
        return self;
    };
}

- (NKMargin *(^)(CGFloat, CGFloat))center {
    return ^(CGFloat x, CGFloat y) {
        self.valueOfCenter = CGPointMake(x, y);
        return self;
    };
}

- (NKMargin *(^)(CGFloat, CGFloat))origin {
    return ^(CGFloat x, CGFloat y) {
        self.valueOfOrigin = CGPointMake(x, y);
        return self;
    };
}

- (NKMargin *(^)(CGFloat, CGFloat))size {
    return ^(CGFloat w, CGFloat h) {
        self.valueOfSize = CGSizeMake(w, h);
        return self;
    };
}

- (NKMultiple *)multiple {
    if (_multiple) return _multiple;
    _multiple = [[NKMultiple alloc] initWithMargin:self];
    return _multiple;
}

- (NKAlignment *)aligned {
    if (_aligned) return _aligned;
    _aligned = [[NKAlignment alloc] initWithMargin:self];
    return _aligned;
}

- (NKRelative *)relative {
    if (_relative) return _relative;
    _relative = [[NKRelative alloc] initWithMargin:self];
    return _relative;
}

nk_margin_getter(left, NKLayoutMarginAttributeLeft);
nk_margin_getter(top, NKLayoutMarginAttributeTop);
nk_margin_getter(right, NKLayoutMarginAttributeRight);
nk_margin_getter(bottom, NKLayoutMarginAttributeBottom);
nk_margin_getter(width, NKLayoutMarginAttributeWidth);
nk_margin_getter(height, NKLayoutMarginAttributeHeight);
nk_margin_getter(centerX, NKLayoutMarginAttributeCenterX);
nk_margin_getter(centerY, NKLayoutMarginAttributeCenterY);
nk_margin_getter(edge, NKLayoutMarginAttributeEdge);

@end
