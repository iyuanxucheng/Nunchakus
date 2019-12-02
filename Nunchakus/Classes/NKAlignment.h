//
//  NKAlignment.h
//  Nunchakus
//
//  Created by 王亚军 on 2019/12/1.
//

#import <Foundation/Foundation.h>
@class NKMargin;

NS_ASSUME_NONNULL_BEGIN

@interface NKAlignment : NSObject

@property (nonatomic, strong) void (^with)(id attr);

- (instancetype)initWithMargin:(NKMargin *)margin;

@end

NS_ASSUME_NONNULL_END
