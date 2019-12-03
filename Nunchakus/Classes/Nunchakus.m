//
//  Nunchakus.m
//  Nunchakus
//
//  Created by WangYajun on 2019/12/2.
//


#import "Nunchakus.h"

void nk_executeDeferBlock (__strong nk_deferBlock *block) {
    (*block)();
}
