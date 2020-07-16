//
//  GitUsersRepos.h
//  AddApptrFramework
//
//  Created by Syed Najam on 16/07/2020.
//  Copyright © 2020 Syed Najam. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GitUsersRepos : NSObject

+ (void) getGithubUserRepos: (NSString *)username successBlock:(void (^) (NSArray* responseObject))successHandler failureBlock:(void (^) (NSString* responseObject))failureHandler;

@end

NS_ASSUME_NONNULL_END
