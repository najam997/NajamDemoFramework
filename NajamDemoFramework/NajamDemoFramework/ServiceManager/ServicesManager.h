//
//  ServicesManager.h
//  AddApptrFramework
//
//  Created by Syed Najam on 16/07/2020.
//  Copyright © 2020 Syed Najam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface ServicesManager : NSObject

-(void)didGetCall:(NSString*)mName successBlock:(void (^) (id responseObject))successHandler failureBlock:(void (^) (id responseObject))failureHandler;

@end
