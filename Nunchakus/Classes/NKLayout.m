//
// Created by WangYajun on 2019/11/29.
//

#import "NKLayout.h"
#import "NKMacroConstant.h"
#import "NKMargin.h"
#import "NKLayoutEnum.h"

@interface NKLayout ()

@property (nonatomic, weak) UIView *context;

@property (nonatomic, strong) NSMutableSet *marginSet;
@property (nonatomic, strong) NSMutableSet *paddingSet;


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
    }
    return self;
}

- (void)make {
    
}

- (CGRect)calculateFrameWithMargins:(NSSet<NKMargin *> *)margins {
    return CGRectZero;
}

- (void)layoutWithFrame:(CGRect)frame {
    _context.frame = frame;
}

#pragma getter

- (NSMutableSet *)marginSet {
    if (_marginSet) return _marginSet;
    _marginSet = [[NSMutableSet alloc] initWithCapacity:4];
    return _marginSet;
}

- (NSMutableSet *)paddingSet {
    if (_paddingSet) return _paddingSet;
    _paddingSet = [[NSMutableSet alloc] initWithCapacity:4];
    return _paddingSet;
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
