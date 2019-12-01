//
//  NKAlignment.h
//  Nunchakus
//
//  Created by 王亚军 on 2019/12/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, NKLayoutAlignmentMode) {
    NKLayoutAlignmentLeft       = 0,
    NKLayoutAlignmentTop        = 1,
    NKLayoutAlignmentRight      = 2,
    NKLayoutAlignmentBottom     = 3,
    NKLayoutAlignmentCenter     = 4,
};

@interface NKAlignment : NSObject

@property (nonatomic, strong) NKAlignment *left;
@property (nonatomic, strong) NKAlignment *top;
@property (nonatomic, strong) NKAlignment *right;
@property (nonatomic, strong) NKAlignment *bottom;

@property (nonatomic, strong) void (^with)(id attr);


@end

NS_ASSUME_NONNULL_END
