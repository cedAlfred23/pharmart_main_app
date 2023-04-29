//
//  CallKitManager.h
//  ZIMExampleDemo
//
//  Created by 武耀琳 on 2023/1/31.
//

#import <Foundation/Foundation.h>
#import "CallKit/CallKit.h"
#import "PushKit/PushKit.h"
NS_ASSUME_NONNULL_BEGIN

@interface CallKitManager : NSObject<CXProviderDelegate,PKPushRegistryDelegate>

-(void)setInitConfig:(NSDictionary *)configMap;

+(CallKitManager *)getInstance;

+(void)isProduct:(bool) isProduct;

-(void)reportIncomingCallWithTitle:(NSDictionary *)updateMap UUID:(NSString *)uuidSeq;

- (void)reportCallEndedWithUUID:(NSString *)uuidSeq reason:(CXCallEndedReason)endedReason;

-(void)reportCallUpdateWithUUID:(NSDictionary *)updateMap UUID:(NSString *)uuidSeq;

-(void)reportOutgoingCallWithUUID:(NSString *)uuidSeq;

-(void)ActionFail:(NSString *)seq;

-(void)ActionFullFill:(NSString *)seq;

@end

NS_ASSUME_NONNULL_END
