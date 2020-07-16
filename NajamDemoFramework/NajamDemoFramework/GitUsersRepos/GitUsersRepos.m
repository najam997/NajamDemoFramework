//
//  GitUsersRepos.m
//  AddApptrFramework
//
//  Created by Syed Najam on 16/07/2020.
//  Copyright © 2020 Syed Najam. All rights reserved.
//

#import "GitUsersRepos.h"
#import "ServicesManager.h"

@implementation GitUsersRepos

//Test

+ (void) getGithubUserRepos:(NSString *)username successBlock:(void (^) (NSArray* responseObject))successHandler failureBlock:(void (^) (NSString* responseObject))failureHandler
{
    ServicesManager *manager = [[ServicesManager alloc] init];
    
    [manager didGetCall:username successBlock:^(id responseObject) {
        
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for (NSDictionary *arr in responseObject) {
            if (![arr isKindOfClass:[NSNull class]]) {
                [array addObject:arr];
            }
        }
        successHandler(array);
        
    } failureBlock:^(NSError *error) {
        
        failureHandler(error.localizedDescription);
    }];
}

@end
