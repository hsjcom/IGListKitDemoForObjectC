//
//  DemoItem.m
//  IGListKitDemoForObjectC
//
//  Created by Soldier on 2017/2/13.
//  Copyright © 2017年 Shaojie Hong. All rights reserved.
//

#import "DemoItem.h"

@implementation DemoItem

+ (DemoItem *)initWithTitle:(NSString *)title itemId:(NSString *)itemId {
    DemoItem *item = [[DemoItem alloc] init];
    item.title = title;
    item.itemId = itemId;
    
    return item;
}

- (id<NSObject>)diffIdentifier {
    return self.itemId;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    return self == object ? true : [self isEqual:object];//YES;
}

@end





@implementation GridItem

+ (GridItem *)initWithColor:(UIColor *)color itemId:(NSString *)itemId itemCount:(int)itemCount {
    GridItem *item = [[GridItem alloc] init];
    item.color = color;
    item.itemId = itemId;
    item.itemCount = itemCount;
    
    return item;
}

- (id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    return self == object ? true : [self isEqual:object];
}

@end
