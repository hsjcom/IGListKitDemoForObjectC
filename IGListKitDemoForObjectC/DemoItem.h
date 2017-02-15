//
//  DemoItem.h
//  IGListKitDemoForObjectC
//
//  Created by Soldier on 2017/2/13.
//  Copyright © 2017年 Shaojie Hong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DemoItem : NSObject<IGListDiffable>

@property (nonatomic, copy) NSString *itemId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;

+ (DemoItem *)initWithTitle:(NSString *)title itemId:(NSString *)itemId;

@end






@interface GridItem : NSObject<IGListDiffable>

@property (nonatomic, copy) NSString *itemId;
@property (nonatomic, assign) NSInteger itemCount;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, copy) NSString *title;

+ (GridItem *)initWithColor:(UIColor *)color itemId:(NSString *)itemId itemCount:(int)itemCount;

@end
