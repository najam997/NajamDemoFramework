//
//  Constant.h
//  AddApptrFramework
//
//  Created by Syed Najam on 16/07/2020.
//  Copyright © 2020 Syed Najam. All rights reserved.
//


#ifndef LondonCab_Constant_h
#define LondonCab_Constant_h

#define AppdelegateRef ((AppDelegate*)[[UIApplication sharedApplication]delegate])
#define DOC_FOLDER [(NSArray *)NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

//web service
#define base_url @"https://api.github.com/users/"

//Fonts
#define LRFont(s)      [UIFont fontWithName:@"Lato-Regular" size:s]
#define LLFont(s)      [UIFont fontWithName:@"Lato-Light" size:s]

//Colors
#define placeholderColor [UIColor colorWithRed:170/255.0 green:170/255.0 blue:170/255.0 alpha:1];
#define bluecolor      [UIColor colorWithRed:1/255.0 green:78/255.0 blue:120/255.0 alpha:1.0];
#define greenColor     [UIColor colorWithRed:49/255.0 green:156/255.0 blue:64/255.0 alpha:1];
#define textColor      [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
#define linesColor     [[UIColor colorWithRed:235/255.0 green:236/255.0 blue:239/255.0 alpha:1] CGColor];

//App Messages
#define invalidInputMesage @"Username is Invalid, please check if there is any special character or any other spell mistake."
#define invalidInputAlert @"Invalid Username"
#define invalidInputCode 422

#define noNetworkMesage @"There is no network connection please make the make sure you are connected to Internet"
#define noNetworkAlert @"Network issue"
#define noNetworkCode 503

//Constant String
#define specialCharacters @"!~`@#$%^&*-+();:={}[],.<>?\\/\"\'"
#define noNetwork @"No Network"
#define wifi @"wifi"
#define mobileData @"mobileData"

#endif
