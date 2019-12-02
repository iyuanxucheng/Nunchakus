//
//  UIView+Nunchakus.m
//  Nunchakus
//
//  Created by WangYajun on 2019/11/29.
//

#import "UIView+Nunchakus.h"
#import <objc/runtime.h>
#import "Nunchakus.h"

@interface UIView ()

@property (nonatomic, strong) NKLayout *nk_layout;

@end

@implementation UIView (Nunchakus)

- (void)nk_make {
    [self.nk_layout make];
}

- (void)nk_makeLayout:(void (^)(NKLayout *))maker {
    !maker ?: maker(self.nk_layout);
}

- (void)setNk_layout:(NKLayout *)nk_layout {
    objc_setAssociatedObject(self, @selector(nk_layout), nk_layout, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark -- getter

- (NKLayout *)nk_layout {
    NKLayout *layout = objc_getAssociatedObject(self, @selector(nk_layout));
    if (layout) return layout;
    //
    layout = [[NKLayout alloc] initWithContext:self];

    [self setNk_layout:layout];

    defer {
        NSLog(@"layout dog defer");
    };

    return layout;
}


nk_layout_margin_getter(left);
nk_layout_margin_getter(top);
nk_layout_margin_getter(right);
nk_layout_margin_getter(bottom);
nk_layout_margin_getter(width);
nk_layout_margin_getter(height);
nk_layout_margin_getter(centerX);
nk_layout_margin_getter(centerY);
nk_layout_margin_getter(edge);

@end
