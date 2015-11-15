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
        NSLog(@"arr count:%@",@([arr count]));
        it(@"数据表是否有数据",^{
            [[theValue([arr count]) should]beGreaterThan:theValue(0)];
        });
    });
});

SPEC_END
