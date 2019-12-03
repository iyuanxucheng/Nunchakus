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
@property (nonatomic, assign) NKLayoutRelativeAttribute relative;
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

- (NKMargin *(^)(CGFloat))offset {
    return ^(CGFloat value) {
        if (NKLayoutRelativeOn == self.relative) return self.margin;
        //
        self.valueOfOffset = value;
        return self.margin;
    };
}

- (NKRelative *(^)(id))to {
    return ^(id attr) {
        [self attrbuteWithAttr:attr relative:NKLayoutRelativeTo];
        //
        self.relative = NKLayoutRelativeTo;
        return self;
    };
}

- (NKRelative *(^)(id))on {
    return ^(id attr) {
        [self attrbuteWithAttr:attr relative:NKLayoutRelativeOn];
        //
        self.relative = NKLayoutRelativeOn;
        return self;
    };
}

- (NKRelative * (^)(id))in {
    return ^(id attr) {
        [self attrbuteWithAttr:attr relative:NKLayoutRelativeIn];
        //
        self.relative = NKLayoutRelativeIn;
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
        
        if (NKLayoutRelativeIn == relative) {
            _relativeAttribute = [self attrbuteWithMargin:_margin];
            return;
        }

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
                _relativeAttribute = _margin.attribute;
                break;
        }
        return;
    }
    
    NSAssert(NO, @"Alignment type error ...");
}

- (NKLayoutMarginAttribute)attrbuteWithMargin:(NKMargin *)margin {
    if (NKLayoutMarginAttributeCenterY >= margin.attribute) {
        return margin.attribute;
    }
    return NKLayoutMarginAttributeDefault;
}

@end
