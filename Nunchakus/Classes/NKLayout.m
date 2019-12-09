//
// Created by WangYajun on 2019/11/29.
//

#import "NKLayout.h"
#import "NKMacroConstant.h"
#import "NKMargin.h"
#import "NKLayoutEnum.h"

@interface NKLayout ()

@property (nonatomic, assign) CGPoint valueOfCenter;
@property (nonatomic, assign) CGPoint valueOfOrigin;
@property (nonatomic, assign) CGSize valueOfSize;

@property (nonatomic, weak) UIView *context;

@property (nonatomic, strong) NSMutableSet<NKMargin *> *marginSet;

@property (nonatomic, strong) NKMargin *left;
@property (nonatomic, strong) NKMargin *top;
@property (nonatomic, strong) NKMargin *right;
@property (nonatomic, strong) NKMargin *bottom;

@property (nonatomic, strong) NKMargin *width;
@property (nonatomic, strong) NKMargin *height;
@property (nonatomic, strong) NKMargin *centerX;
@property (nonatomic, strong) NKMargin *centerY;
@property (nonatomic, strong) NKMargin *edge;


@end


@implementation NKLayout

#ifdef DEBUG
- (void)dealloc {
    NKLog(@"%s", __PRETTY_FUNCTION__);
}
#endif

- (instancetype)initWithContext:(UIView *)context {
    self = [super init];
    if (self) {
        _context = context;
        _valueOfOrigin = CGPointMake(NSUIntegerMax, NSUIntegerMax);
        _valueOfSize = CGSizeMake(NSUIntegerMax, NSUIntegerMax);
        _valueOfCenter = CGPointMake(NSUIntegerMax, NSUIntegerMax);
    }
    return self;
}

- (void)make {
    
    CGPoint maxPoint = CGPointMake(NSUIntegerMax, NSUIntegerMax);
    CGSize maxSize = CGSizeMake(NSUIntegerMax, NSUIntegerMax);
    
    BOOL isValidSize = !CGSizeEqualToSize(_valueOfSize, maxSize);
    BOOL isValidOrigin = !CGPointEqualToPoint(_valueOfOrigin, maxPoint);
    BOOL isValidCenter = !CGPointEqualToPoint(_valueOfCenter, maxPoint);

    if (isValidOrigin && isValidSize) {
        CGRect frame = (CGRect){_valueOfOrigin, _valueOfSize};
        [self layoutWithFrame:frame];
        return;
    }
    
    if (isValidCenter && isValidSize) {
        CGPoint origin = CGPointMake(_valueOfCenter.x - (_valueOfSize.width * 0.5), _valueOfCenter.y - (_valueOfSize.height * 0.5));
        CGRect frame = (CGRect){origin, _valueOfSize};
        [self layoutWithFrame:frame];
        return;
    }
    
    CGRect frame = [self calculateFrameWithMarginSet];
    [self layoutWithFrame:frame];
}

- (CGRect)calculateFrameWithMarginSet {
    return CGRectZero;
}

- (void)layoutWithFrame:(CGRect)frame {
    _context.frame = frame;
}

- (NKLayout *(^)(CGFloat, CGFloat))center {
    return ^(CGFloat x, CGFloat y) {
        self.valueOfCenter = CGPointMake(x, y);
        return self;
    };
}

- (NKLayout *(^)(CGFloat, CGFloat))origin {
    return ^(CGFloat x, CGFloat y) {
        self.valueOfOrigin = CGPointMake(x, y);
        return self;
    };
}

- (NKLayout *(^)(CGFloat, CGFloat))size {
    return ^(CGFloat w, CGFloat h) {
        self.valueOfSize = CGSizeMake(w, h);
        return self;
    };
}

#pragma getter

- (NSMutableSet<NKMargin *> *)marginSet {
    if (_marginSet) return _marginSet;
    _marginSet = [[NSMutableSet alloc] initWithCapacity:4];
    return _marginSet;
}

nk_layout_getter(left, NKLayoutMarginAttributeLeft);
nk_layout_getter(top, NKLayoutMarginAttributeTop);
nk_layout_getter(right, NKLayoutMarginAttributeRight);
nk_layout_getter(bottom, NKLayoutMarginAttributeBottom);
nk_layout_getter(width, NKLayoutMarginAttributeWidth);
nk_layout_getter(height, NKLayoutMarginAttributeHeight);
nk_layout_getter(centerX, NKLayoutMarginAttributeCenterX);
nk_layout_getter(centerY, NKLayoutMarginAttributeCenterY);
nk_layout_getter(edge, NKLayoutMarginAttributeEdge);

@end
