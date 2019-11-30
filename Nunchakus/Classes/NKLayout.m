//
// Created by WangYajun on 2019/11/29.
//

#import "NKLayout.h"
#import "NKMacroConstant.h"

@interface NKLayout ()

@property (nonatomic, weak) UIView *context;

@property (nonatomic, strong) NSMutableSet *marginSet;
@property (nonatomic, strong) NSMutableSet *paddingSet;

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

- (CGRect)calculateFrameWithMargins:(NSSet<NKMargin *> *)margins {
    return CGRectZero;
}

//- (CGRect)calculateFrameWithPadding:(NSSet<NKPadding *> *)paddings {
//    return CGRectZero;
//}

- (void)layoutWithFrame:(CGRect)frame {
    _context.frame = frame;
}

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

@end
