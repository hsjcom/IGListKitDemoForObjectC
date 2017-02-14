//
//  DemoItem.m
//  IGListKitDemoForObjectC
//
//  Created by Soldier on 2017/2/13.
//  Copyright © 2017年 Shaojie Hong. All rights reserved.
//

#import "DemoItem.h"

@implementation DemoItem

+ (DemoItem *)initWithTitle:(NSString *)title {
    DemoItem *item = [[DemoItem alloc] init];
    item.title = title;
    
    return item;
}

- (id<NSObject>)diffIdentifier {
    return self.title;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    return YES;
}

@end
