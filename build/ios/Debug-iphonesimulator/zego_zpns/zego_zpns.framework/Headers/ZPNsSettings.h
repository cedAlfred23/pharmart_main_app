//
//  ZPNsSettings.h
//  zego_zpns
//
//  Created by 武耀琳 on 2023/3/6.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
NS_ASSUME_NONNULL_BEGIN

@interface ZPNsSettings : NSObject

@property (class, assign) bool isProduct;

@property (class,assign) FlutterEventSink event;

@property (class,assign) FlutterMethodChannel *methodChannel;

@property (class,assign) NSMutableDictionary *didReceiveRemoteNotificationCompletionSeqMap;

+(NSString *)generateSeqStr;

@end

NS_ASSUME_NONNULL_END
