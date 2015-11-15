//
//  TCSDAL.m
//  TCSDAL
//
//  Created by huanglexian on 15/11/14.
//  Copyright © 2015年 spbreak. All rights reserved.
//

#import "TCSDAL.h"

#import "FMDB.h"



@implementation TCSDAL
static FMDatabase *db;

/**
 *  获取数据库文件位置
 *
 *  @param dbName 数据库名称
 *
 *  @return 数据库文件位置
 */
+(NSString *)getFilePathForDataBase:(NSString *)dbName{
    NSString *dbFilePath=[[NSBundle mainBundle]pathForResource:dbName ofType:nil];
    return dbFilePath;
}

/**
 *  配置数据库地址
 */
+(void)dataBaseForPath:(NSString *)strPath{
    db=[FMDatabase databaseWithPath:strPath];
}

/**
 *  打开数据库是否成功
 *
 *  @return YES:成功 NO:失败
 */
+(BOOL)isOpenDataBase{
    return [db open];
}

/**
 *  判断对应表是否存在
 *
 *  @param tableName 对应表名
 *
 *  @return YES:存在 NO:不存在
 */
+(BOOL)isTableExists:(NSString *)tableName{
    return [db tableExists:tableName];
}

/**
 *  获取Table的数据,以NSArray<NSDictionary *>的形式返回
 *
 *  @param table    表名
 *  @param where    筛选条件
 *  @param arrField 获取的列名
 *
 *  @return 符合条件的表数据(NSArray<NSDictionary *>)
 */
+(NSArray *)getManyOfTable:(NSString *)table withWhere:(NSString *)where withArrField:(NSArray *)arrField{
    if (!db) {
        NSString *strPath=[self getFilePathForDataBase:kDBName];
        [self dataBaseForPath:strPath];
    }
    if (![db open]) {
        NSLog(@"数据库打开失败");
        return nil;
    }
    [db setShouldCacheStatements:YES];
    if (![db tableExists:table]) {
        NSLog(@"数据库不存在 %@ 表",table);
        return nil;
    }
    // 定义一个可变数组,用来存放查询的结果,返回给调用者
    NSMutableArray *arrM=[[NSMutableArray alloc]init];
    // 定义一个结果集,存放查询的数据
    NSString *strField=[arrField componentsJoinedByString:@","];
    NSString *strSql;
    if ([where isEqualToString:@""]||where==nil) {
        strSql=[NSString stringWithFormat:@"select %@ from %@",strField,table];
    }else{
        strSql=[NSString stringWithFormat:@"select %@ from %@ where %@",strField,table,where];
    }
    FMResultSet *rs=[db executeQuery:strSql];
    // 判断结果集中是否有数据,如果有则取出数据
    while ([rs next]) {
        NSMutableDictionary *dictM=[[NSMutableDictionary alloc]init];
        for (NSString *temp in arrField) {
            [dictM setObject:[rs stringForColumn:temp] forKey:temp];
        }
        [arrM addObject:dictM];
    }
    return [NSArray arrayWithArray:arrM];
}

/**
 *  获得单行数据,以NSDictionary形式返回
 *
 *  @param table    表名
 *  @param where    筛选SQL语句
 *  @param arrField 列名
 *
 *  @return 获得单行数据
 */
+(NSDictionary *)getSingleOfTable:(NSString *)table withWhere:(NSString *)where withArrField:(NSArray *)arrField{
    if (!db) {
        NSString *strPath=[self getFilePathForDataBase:kDBName];
        [self dataBaseForPath:strPath];
    }
    if (![db open]) {
        NSLog(@"数据库打开失败");
        return nil;
    }
    [db setShouldCacheStatements:YES];
    if (![db tableExists:table]) {
        NSLog(@"数据库不存在 %@ 表",table);
        return nil;
    }
    // 定义一个可变数组,用来存放查询的结果,返回给调用者
    NSMutableDictionary *dictM=[[NSMutableDictionary alloc]init];
    // 定义一个结果集,存放查询的数据
    NSString *strField=[arrField componentsJoinedByString:@","];
    FMResultSet *rs=[db executeQuery:[NSString stringWithFormat:@"select %@ from %@ where %@",strField,table,where]];
    // 判断结果集中是否有数据,如果有则取出数据
    while ([rs next]) {
        for (NSString *temp in arrField) {
            NSString *str=[rs stringForColumn:temp];
            if (str==nil) {
                str=@"";
            }
            [dictM setObject:str forKey:temp];
        }
        break;
    }
    
    return [NSDictionary dictionaryWithDictionary:dictM];
}
@end
