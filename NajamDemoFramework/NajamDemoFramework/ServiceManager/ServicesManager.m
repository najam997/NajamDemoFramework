//
//  ServicesManager.m
//  AddApptrFramework
//
//  Created by Syed Najam on 16/07/2020.
//  Copyright © 2020 Syed Najam. All rights reserved.
//

#import "ServicesManager.h"
#import "AFNetworking.h"
#import "Constant.h"

@interface ServicesManager ()

@property(nonatomic,strong)NSOperationQueue *requestQueue;

@end

@implementation ServicesManager
#pragma -mark Reachibility

- (id) init {
    
    self = [super init];
    if(self) {
        self.requestQueue = [[NSOperationQueue alloc] init];
        self.requestQueue.maxConcurrentOperationCount = 2;
    }
    return self;
}

-(NSString*)isNetworkReachable
{
    NSString *netwrokCheck = @"";
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    
    NetworkStatus status = [reachability currentReachabilityStatus];
    
    if(status == NotReachable)
    {
        //No internet
        netwrokCheck = noNetwork;
    }
    else if (status == ReachableViaWiFi)
    {
        //WiFi
        netwrokCheck = wifi;
    }
    else if (status == ReachableViaWWAN)
    {
        //3G
        netwrokCheck = mobileData;
    }
    
    
    return netwrokCheck;
}

-(void)didGetCall:(NSString*)mName successBlock:(void (^) (id responseObject))successHandler failureBlock:(void (^) (id responseObject))failureHandler{
    
    NSString *networkStr = [self isNetworkReachable];
    NSCharacterSet *specialCharacterSet = [NSCharacterSet characterSetWithCharactersInString:specialCharacters];
    
    if([mName  isEqual: @""] || [mName.lowercaseString rangeOfCharacterFromSet:specialCharacterSet].length){
        NSError *error = [NSError errorWithDomain:invalidInputAlert code:invalidInputCode userInfo:@
        {
            NSLocalizedDescriptionKey:invalidInputMesage
        }];
        
        failureHandler(error);
    }
    
    else if ([networkStr isEqualToString:wifi] || [networkStr isEqualToString:mobileData]) {
        
        NSString *serviceUrl = [NSString stringWithFormat:@"%@%@%s", base_url , mName, "/repos"];
        serviceUrl = [serviceUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.requestSerializer.timeoutInterval = 30;
        
        [manager GET:serviceUrl parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            successHandler(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failureHandler(error);
        }];
        
    }
    else {
        NSError *error = [NSError errorWithDomain:noNetworkAlert code:noNetworkCode userInfo:@
        {
            NSLocalizedDescriptionKey:noNetworkMesage
        }];
        
        failureHandler(error);
    }
}

@end
