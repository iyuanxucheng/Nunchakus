//
//  UIView+Nunchakus.m
//  Nunchakus
//
//  Created by WangYajun on 2019/11/29.
//

#import "UIView+Nunchakus.h"
#import <objc/runtime.h>

@implementation UIView (Nunchakus)

- (NKLayout *)layout_dog {
    NKLayout *layout = objc_getAssociatedObject(self, @selector(layout_dog));
    if (layout) return layout;
    //
    layout = [[NKLayout alloc] initWithContext:self];

    [self setLayout_dog:layout];
    
    return layout;
}

- (void)setLayout_dog:(NKLayout *)layout_dog {
    objc_setAssociatedObject(self, @selector(layout_dog), layout_dog, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)layout_make:(void (^)(NKLayout * _Nonnull))maker {
    !maker ?: maker(self.layout_dog);
}

@end
