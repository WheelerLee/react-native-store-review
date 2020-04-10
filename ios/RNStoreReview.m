//
//  RNReview.m
//  Student
//
//  Created by liwei on 2019/7/29.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "RNStoreReview.h"
#import <StoreKit/StoreKit.h>

@implementation RNStoreReview

RCT_EXPORT_MODULE(StoreReview)

#pragma mark 弹出评分框，适用于ios10.3及之后的APP
RCT_EXPORT_METHOD(show) {
  
  [SKStoreReviewController requestReview];
  
}

#pragma mark 直接跳转到APP store评分页面，适用于ios10.3之前的APP Apple ID在appstoreconnect创建后由系统分配
RCT_REMAP_METHOD(showOldWay, withAppleID: (NSString *) appledID resolver: (RCTPromiseResolveBlock) resolve rejecter: (RCTPromiseRejectBlock) reject) {
  
  NSString *str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@?action=write-review", appledID];
  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
  
}

@end
