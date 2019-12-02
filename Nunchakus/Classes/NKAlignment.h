//
//  NKAlignment.h
//  Nunchakus
//
//  Created by 王亚军 on 2019/12/1.
//

#import <Foundation/Foundation.h>
#import "NKLayoutEnum.h"

@class NKMargin;

NS_ASSUME_NONNULL_BEGIN

@interface NKAlignment : NSObject

@property (nonatomic, assign, readonly) NKLayoutEdgeAttribute alignmentAttribute;

/// UIView or NKMargin
@property (nonatomic, strong, readonly) NKMargin *(^with)(id attr);

- (instancetype)initWithMargin:(NKMargin *)margin;

@end

NS_ASSUME_NONNULL_END
