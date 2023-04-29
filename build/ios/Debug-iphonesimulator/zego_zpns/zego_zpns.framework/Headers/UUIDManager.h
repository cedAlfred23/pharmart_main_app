//
//  UUIDManager.h
//  Pods-Runner
//
//  Created by 武耀琳 on 2023/3/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UUIDManager : NSObject

+(instancetype)getInstance;

-(void)generateUUID:(NSString *)seq;

-(NSUUID *)getUUID:(NSString *)seq;

@end

NS_ASSUME_NONNULL_END
