//
//  SelectSpec.m
//  TCSDAL
//
//  Created by huanglexian on 15/11/14.
//  Copyright © 2015年 spbreak. All rights reserved.
//

#import "TCSDAL.h"

SPEC_BEGIN(Select)
// 对象 行为 结果
describe(@"数据库", ^{
    context(@"查询数据", ^{
        NSArray *arr=[TCSDAL getManyOfTable:@"name" withWhere:nil withArrField:@[@"name"]];
        it(@"数据表多行数据是否有数据",^{
            [[theValue([arr count]) should]beGreaterThan:theValue(0)];
        });
        NSDictionary *dict=[TCSDAL getSingleOfTable:@"surnameofsource" withWhere:@"surname = '党'" withArrField:@[@"content"]];
        it(@"单行数据获取",^{
            [[theValue([[dict allValues] count]) should]beGreaterThan:theValue(0)];
        });
    });
});

SPEC_END
