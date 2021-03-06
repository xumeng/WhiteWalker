//
//  ToolsUtil.m
//  WhiteWalker
//
//  Created by Amon on 2017/3/13.
//  Copyright © 2017年 GodPlace. All rights reserved.
//

#import "ToolsUtil.h"

@implementation ToolsUtil

#pragma mark - config
+ (void)saveToUserDefaults:(NSDictionary *)dic dictName:(NSString *)dictName
{
    NSUserDefaults *persistentDefaults = [NSUserDefaults standardUserDefaults];
    
    [persistentDefaults setObject:dic forKey:dictName];
    
    if (persistentDefaults)
    {
        [persistentDefaults synchronize];
    }
}

+ (void)saveUserConfigToNSUserDefaults:(NSDictionary *)dic
{
    [self saveToUserDefaults:dic dictName:@"userConfig"];
}

+ (void)saveAppConfigToNSUserDefaults:(NSDictionary *)dic
{
    [self saveToUserDefaults:dic dictName:@"AppConfig"];
}

+ (NSDictionary *)getUserDefaults:(NSString *)dictName
{
    NSUserDefaults *persistentDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *userDict = (NSMutableDictionary *)[persistentDefaults objectForKey:dictName];
    NSDictionary *newUserDict;
    if (!userDict) {
        newUserDict = [[NSMutableDictionary alloc] init];
    } else {
        newUserDict = [userDict mutableCopy];
    }
    return newUserDict;
}


+ (NSDictionary *)getUserConfig
{
    return [self getUserDefaults:@"userConfig"];
}

+ (NSDictionary *)getAppConfig
{
    return [self getUserDefaults:@"AppConfig"];
}


@end
