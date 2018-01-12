//
//  SandBoxHelper.h
//  IAPDemo
//
//  Created by Charles.Yao on 2016/10/31.
//  Copyright © 2016年 com.pico. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SandBoxHelper : NSObject

+ (NSString *)homePath;             // 程序主目录，可见子目录(3个):Documents、Library、tmp

+ (NSString *)appPath;              // 程序目录，不能存任何东西

+ (NSString *)docPath;              // 文档目录，需要ITUNES同步备份的数据存这里，可存放用户数据

+ (NSString *)libPrefPath;          // 配置目录，配置文件存这里

+ (NSString *)libCachePath;         // 缓存目录，系统永远不会删除这里的文件，ITUNES会删除

+ (NSString *)tmpPath;              // 临时缓存目录，APP退出后，系统可能会删除这里的内容

+ (NSString *)iapReceiptPath;       //用于存储iap内购返回的购买凭证
// 获取Documents路径
+ (NSString *)getDocumentsPath;
// 创建文件夹
//fileName：文件夹名称
+(void)createDirectoryFileName:(NSString *)fileName;
// 创建文件
//name:文件名称
+ (void)createFileName:(NSString *)name;
// 写入文件
//fileName:文件名称
//contentStr：文件内容
+(void)writeFileName:(NSString *)fileName Content:(NSString *)contentStr;
// 读取文件
//contentStr:文件名称
+(NSString *)readFileContent:(NSString *)contentStr;

// 判断文件是否存在
+(BOOL)isSxistAtPath:(NSString *)filePath;
// 计算文件大小
+ (unsigned long long)fileSizeAtPath:(NSString *)filePath;
// 计算整个文件夹中所有文件大小
+(unsigned long long)folderSizeAtPath:(NSString*)folderPath;
// 删除文件
//fileName:文件名称
+ (void)deleteFileName:(NSString *)fileName;
// 移动文件
//fileName:源文件名称
//newName:新文件名称
+ (void)moveFileName:(NSString *)fileName NewName:(NSString *)newName;
// 重命名
//fileName:原文件名称
//newName：新文件名称
+ (void)renameFileName:(NSString *)fileName NewName:(NSString *)newName;
@end
