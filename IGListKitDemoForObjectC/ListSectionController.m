//
//  ListSectionController.m
//  IGListKitDemoForObjectC
//
//  Created by Soldier on 2017/2/14.
//  Copyright © 2017年 Shaojie Hong. All rights reserved.
//

#import "ListSectionController.h"
#import "ListCell.h"
#import "DemoItem.h"


@interface ListSectionController ()

@property (nonatomic, strong) NSObject *item;

@end




@implementation ListSectionController

#pragma mark - IGListSectionType

- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 60);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    ListCell *cell = [self.collectionContext dequeueReusableCellOfClass:[ListCell class]
                                                   forSectionController:self
                                                                atIndex:index];
    [cell updateWithObject:self.item];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.item = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    DemoItem *dItem = (DemoItem *)self.item;
    NSLog(@"--didSelectItemAtIndex %ld %@", (long)index, dItem.itemId);
}

@end
