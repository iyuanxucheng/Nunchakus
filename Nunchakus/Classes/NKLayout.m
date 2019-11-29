//
// Created by WangYajun on 2019/11/29.
//

#import "NKLayout.h"
#import "NKMacroConstant.h"

@interface NKLayout ()

@property (nonatomic, weak) UIView *context;

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


- (CGRect)calculateFrameWithMargins:(NSArray<NKMargin *> *)margins {
    return CGRectZero;
}

- (CGRect)calculateFrameWithPadding:(NSArray<NKPadding *> *)paddings {
    return CGRectZero;
}

- (void)layoutWithFrame:(CGRect)frame {
    _context.frame = frame;
}


@end
