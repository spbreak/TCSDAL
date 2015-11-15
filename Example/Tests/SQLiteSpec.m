//
//  SQLiteSpec.m
//  TCSDAL
//
//  Created by huanglexian on 15/11/14.
//  Copyright © 2015年 spbreak. All rights reserved.
//
#import "TCSDAL.h"

SPEC_BEGIN(SQLite)

describe(@"SQLite", ^{
    context(@"获取数据库文件地址和打开数据库和表是否存在", ^{
        NSString *strPath=[TCSDAL getFilePathForDataBase:kDBName];
        it(@"获取地址", ^{
            [[strPath shouldNot]beNil];
        });
        [TCSDAL dataBaseForPath:strPath];
        
        BOOL isOpen=[TCSDAL isOpenDataBase];
        it(@"打开数据库",^{
            [[theValue(isOpen) should]equal:theValue(YES)];
        });
        BOOL isTable=[TCSDAL isTableExists:@"name"];
        it(@"检查数据表存在",^{
            [[theValue(isTable) should]equal:theValue(YES)];
        });
    });
});

SPEC_END