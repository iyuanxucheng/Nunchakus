//
//  NKRelative.m
//  Nunchakus
//
//  Created by WangYajun on 2019/12/2.
//

#import "NKRelative.h"
#import "NKMargin.h"


@interface NKRelative ()

@property (nonatomic, assign) CGFloat valueOfOffset;
@property (nonatomic, assign) NKLayoutMarginAttribute relativeAttribute;

@property (nonatomic, weak) NKMargin *margin;

@end

@implementation NKRelative

#ifdef DEBUG
- (void)dealloc {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}
#endif

- (instancetype)initWithMargin:(NKMargin *)margin {
    self = [super init];
    if (self) {
        _margin = margin;
    }
    return self;
}

- (NKMargin * _Nonnull (^)(CGFloat))valueOf {
    return ^(CGFloat value) {
        self.valueOfOffset = value;
        return self.margin;
    };
}

- (NKRelative *(^)(id))to {
    return ^(id attr) {
        [self attrbuteWithAttr:attr relative:NKLayoutRelativeTo];
        return self;
    };
}

- (NKRelative *(^)(id))on {
    return ^(id attr) {
        [self attrbuteWithAttr:attr relative:NKLayoutRelativeOn];
        return self;
    };
}

- (NKRelative * (^)(id))in {
    return ^(id attr) {
        [self attrbuteWithAttr:attr relative:NKLayoutRelativeIn];
        return self;
    };
}

- (void)attrbuteWithAttr:(id)attr relative:(NKLayoutRelativeAttribute)relative {
    NKMargin *obj = attr;

    if ([obj isKindOfClass:NKMargin.class]) {
        _relativeAttribute = [self attrbuteWithMargin:obj];
        return;
    }
    if ([obj isKindOfClass:UIView.class]) {

        if (NKLayoutRelativeTo == relative || NKLayoutRelativeOn == relative) {

            switch (_margin.attribute) {
                case NKLayoutMarginAttributeLeft:
                    _relativeAttribute = NKLayoutMarginAttributeRight;
                    break;
                    case NKLayoutMarginAttributeTop:
                    _relativeAttribute = NKLayoutMarginAttributeBottom;
                        break;
                    case NKLayoutMarginAttributeRight:
                    _relativeAttribute = NKLayoutMarginAttributeLeft;
                        break;
                    case NKLayoutMarginAttributeBottom:
                    _relativeAttribute = NKLayoutMarginAttributeTop;
                        break;

                default:
                    break;
            }
            return;
        }
        _relativeAttribute = [self attrbuteWithMargin:_margin];

    } else {
        NSAssert(NO, @"Alignment type error ...");
    }
}

- (NKLayoutMarginAttribute)attrbuteWithMargin:(NKMargin *)margin {
    if (NKLayoutMarginAttributeCenterY >= margin.attribute) {
        return margin.attribute;
    }
    return NKLayoutMarginAttributeDefault;
}

@end
