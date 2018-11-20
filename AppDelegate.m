//
//  AppDelegate.m
//  LPCommon
//
//  Created by pill on 2018/11/20.
//  Copyright © 2018年 LP. All rights reserved.
//

#import "AppDelegate.h"
#import "NSData+EHKAES.h"
#import "EHKBase64.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

//补充字符串
-(NSMutableString *)FillInString:(NSString *)str {
    NSInteger length = str.length % 16;
    NSMutableString * tempStr = [NSMutableString stringWithString:str];
    if (length == 0) {
        return tempStr;
    }
    for (int i = 0; i<(16 - length); i++) {
        [tempStr appendString:@"\0"];
    }
    return tempStr;
}

//文件处理
-(void)handleFileTxt{
    //获取需要处理的文件
    NSString * fileStr = [[NSBundle mainBundle] pathForResource:@"sss" ofType:@"txt"];
    NSData *data = [NSData alloc]initWithContentsOfFile:fileStr];
    //字符串处理
    NSString *readStr =[[NSString alloc]initWithData:data encoding:NSASCIIStringEncoding];
    //空格分行
    NSArray * arr = [readStr componentsSeparatedByString:@"\n"];
    NSMutableArray * totDic = [NSMutableArray array];
    //便利
    for ( int i = 0; i<arr.count; i++) {
        NSString * str = arr [i];
        //如果这个行为空为无意义的行 读取下一行
        if ([str isEqualToString: @""]) {
            continue;
        }
        //分割
        NSArray * arr1 = [str componentsSeparatedByString:@"  "];
        //标记只取三次
        int t = 0  ;
        NSMutableDictionary * subDic = [NSMutableDictionary dictionary];
        for (int j = 0; j<arr1.count; j++) {
            NSString * str1 = arr1 [j];
            //如果这个str为空为无意义的行 读取下一个
            if ([str1 isEqualToString: @""]) {
                continue;
            }
            //设置当前key
            NSString * key = @"sss";
            //判断当前便利的的key值
            if (t ==0) {
                key = @"cn_name";
            } else if (t ==1) {
                key = @"code";
            }
            else if (t ==2) {
                key = @"name";
            }
            else if (t >=3) {
                continue;
            }
            t++;
            [subDic setObject:str1 forKey:key];
        }
        [totDic addObject:subDic];
        
    }
    //保存本地
    //todo 保存到项目里面
    [totDic writeToFile:@"/Users/lzq/Desktop/heh.plist" atomically:YES];
}

-(void)jiemi {
    NSData *aes_data = [@"GwEzwk/2GvMjWsKmEbNCCJ7fjwPsaWddcFIWOnquaZ1hSx/JXqPUIv9XNVjib67HcW/RG626omXhqsdbOWFwfgQtiAweNcMnLhBpeems6T0VsFavoMeDwi61UINolTyOnZZbqLxFBp1NuMASi+6kcFT+vCdASPYLlEHw5ZRonPP3Uh9spKWfZZ9DSnO6+r6fI7dSabHZetOPMK5eOa3l6ajYqBnGOdxwJeyGj1cp1AW7PVWG2qoJNvc8XgX1yR5ShEsujsNB8qKaRHv18qbvmZfpPrztPy2GxV+Cs8WQBk4=" base64DecodedData] ;
    NSString * key = [self buwei:@"papaya123!papaya"];
    
    NSString *decryptionString = [[NSString alloc] initWithData:[aes_data AES256_Decrypt:key] encoding:NSUTF8StringEncoding];
    
    
}
-(void)jiami    {
    NSString *aesString = [self buwei:@"39a5995cf7ca9031bc17a7dd2402fd4f"];
    NSString *key = [self buwei:@"papaya123!@#$papya321$#@!"];
    NSData * data = [aesString dataUsingEncoding:NSUTF8StringEncoding];
    NSData * data22 = [data AES256_Encrypt:key];
    NSString * str =   [data22 newStringInBase64FromData];
}
@end
