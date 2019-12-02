//
//  NKMacroConstant.h
//  Nunchakus
//
//  Created by WangYajun on 2019/11/29.
//

#ifndef NKMacroConstant_h
#define NKMacroConstant_h

#define SCREEN_SIZE (UIScreen.mainScreen.bounds.size)

#if defined(__cplusplus)
#define let auto const
#else
#define let const __auto_type
#endif

#if defined(__cplusplus)
#define var auto
#else
#define var __auto_type
#endif


#if DEBUG
#define KEY_PATH(object, property) ((void)(NO && ((void)object.property, NO)), @ #property)
#else
#define KEY_PATH(object, property) (@ #property)
#endif
#if DEBUG
#define PRIVATE_KEY_PATH(object, property) ((void)(NO && ((void)object->property, NO)), @#property)
#else
#define PRIVATE_KEY_PATH(object, property) (@ #property)
#endif

#if defined(DEBUG)
#define NKLog(format, ...) NSLog(@"[%d], %@: %@ %@", NSThread.isMainThread, self, NSStringFromSelector(_cmd), ([NSString stringWithFormat:format, ## __VA_ARGS__]));
#else
#define NKLog(format, ...);
#endif

#ifndef RunsStackLog
#ifdef DEBUG
#define RunsStackLog(deep)   NSLog(@"函数调用栈 : %@",[NSThread.callStackSymbols subarrayWithRange:(NSRange){0,deep}]);
#else
#define RunsStackLog(deep)
#endif
#endif

#ifndef NKLogEX
#ifdef DEBUG
#define NKLogEX(format, ...) NSLog(@"[%d] %s %@", NSThread.isMainThread, __PRETTY_FUNCTION__, ([NSString stringWithFormat:format, ## __VA_ARGS__]));
#define RunsReleaseLog() NSLog(@"%@ Release", NSStringFromClass(self.class));
#else
#define NKLogEX(format, ...)
#define RunsReleaseLog()
#endif
#endif

#ifdef DEBUG
#define RunsTimeBegin(TAG) printf("TAG: %s ,%s  begin :%f \n",TAG.UTF8String, __PRETTY_FUNCTION__, [[NSDate date] timeIntervalSince1970]);
#define RunsTimeEnd(TAG) printf("TAG: %s ,%s    end :%f \n",TAG.UTF8String, __PRETTY_FUNCTION__, [[NSDate date] timeIntervalSince1970]);
#else
#define RunsTimeBegin(TAG)
#define RunsTimeEnd(TAG)
#endif

//色值处理转换
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIColorFromRGBA(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

//用于block的弱引用
#define WEAK_SELF_OBJCET_BLOCK(selfObject, weakObject) __weak __typeof(selfObject)weakObject = selfObject;
#define WEAK_OBJCET_STRONG_POINT(weakSelf, strongSelf) __strong __typeof(weakSelf)strongSelf = weakSelf;
#define WEAK_BLOCK_OBJECT(object) WEAK_SELF_OBJCET_BLOCK(object,weak_##object##_kaf9097uq54ni8);
#define BLOCK_OBJECT(object) WEAK_OBJCET_STRONG_POINT(weak_##object##_kaf9097uq54ni8,weak_##object);

#define RandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]
#define RandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]




#define nk_concat(A, B) A ## B

typedef void (^nk_deferBlock)(void);

#define defer  __strong nk_deferBlock nk_concat(nk_deferBlock_, __LINE__) __attribute__((cleanup(nk_executeDeferBlock), unused)) = ^


// proprty

#define nk_property_margin(property_name) \
@property (nonatomic, strong) NKMargin *##property_name;

#define nk_property_margin_readonly(property_name) \
@property (nonatomic, strong, readonly) NKMargin *##property_name;



// -- getter --

#define nk_margin_concat(margin_name) _##margin_name
#define nk_margin_getter(margin_name, margin_enum) \
- (NKMargin *)margin_name { \
if (nk_margin_concat(margin_name)) return nk_margin_concat(margin_name); \
    nk_margin_concat(margin_name) = [[NKMargin alloc] initWithAttribute:margin_enum]; \
    return nk_margin_concat(margin_name); \
}

#define nk_layout_margin_getter(margin_name) \
- (NKMargin *)nk_##margin_name { \
    return self.nk_layout.margin_name; \
}


typedef struct __attribute__((objc_boxable)) CGPoint CGPoint;
typedef struct __attribute__((objc_boxable)) CGSize CGSize;
typedef struct __attribute__((objc_boxable)) CGRect CGRect;
typedef struct __attribute__((objc_boxable)) CGVector CGVector;
typedef struct __attribute__((objc_boxable)) CGAffineTransform CGAffineTransform;
typedef struct __attribute__((objc_boxable)) UIEdgeInsets UIEdgeInsets;
typedef struct __attribute__((objc_boxable)) _NSRange NSRange;



#endif /* NKMacroConstant_h */
