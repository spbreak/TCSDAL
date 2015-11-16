//
//  TCSDAL.h
//  TCSDAL
//
//  Created by huanglexian on 15/11/14.
//  Copyright © 2015年 spbreak. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kDBName (@"TCSDAL.bundle/teacherofcomputesurname.sqlite")

@interface TCSDAL : NSObject
/**
 *  获取数据库文件位置
 *
 *  @param dbName 数据库名称
 *
 *  @return 数据库文件位置
 */
+(NSString *)getFilePathForDataBase:(NSString *)dbName;

/**
 *  配置数据库地址
 */
+(void)dataBaseForPath:(NSString *)strPath;

/**
 *  打开数据库是否成功
 *
 *  @return YES:成功 NO:失败
 */
+(BOOL)isOpenDataBase;

/**
 *  判断对应表是否存在
 *
 *  @param tableName 对应表名
 *
 *  @return YES:存在 NO:不存在
 */
+(BOOL)isTableExists:(NSString *)tableName;

/**
 *  获取Table的数据,以NSArray<NSDictionary *>的形式返回
 *
 *  @param table    表名
 *  @param where    筛选条件
 *  @param arrField 获取的列名
 *
 *  @return 符合条件的表数据(NSArray<NSDictionary *>)
 */
+(NSArray *)getManyOfTable:(NSString *)table withWhere:(NSString *)where withArrField:(NSArray *)arrField;
/**
 *  获得单行数据,以NSDictionary形式返回
 *
 *  @param table    表名
 *  @param where    筛选SQL语句
 *  @param arrField 列名
 *
 *  @return 获得单行数据
 */
+(NSDictionary *)getSingleOfTable:(NSString *)table withWhere:(NSString *)where withArrField:(NSArray *)arrField;
@end
