//
//  DemoSectionController.m
//  IGListKitDemoForObjectC
//
//  Created by Soldier on 2017/2/13.
//  Copyright © 2017年 Shaojie Hong. All rights reserved.
//

#import "DemoSectionController.h"
#import "DemoCell.h"
#import "DemoItem.h"
#import "ListViewController.h"


@interface DemoSectionController ()

@property (nonatomic, strong) NSObject *item;

@end




@implementation DemoSectionController

#pragma mark - IGListSectionType

- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 60);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    DemoCell *cell = [self.collectionContext dequeueReusableCellOfClass:[DemoCell class]
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
    ListViewController *controller = [[ListViewController alloc] init];
    [self.viewController.navigationController pushViewController:controller animated:YES];
    NSLog(@"--didSelectItemAtIndex %ld %@", (long)index, dItem.title);
}

@end
