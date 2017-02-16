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
#import "MixedDataViewController.h"
#import "ViewController.h"
#import "GridBoardViewController.h"

@interface DemoSectionController ()

@property (nonatomic, strong) NSObject *item;

@end




@implementation DemoSectionController

#pragma mark - IGListSectionType

- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 80);
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
    
    if ([self.viewController isKindOfClass:[ViewController class]]) {
        if ([dItem.itemId isEqualToString:@"0"]) {
            ListViewController *controller = [[ListViewController alloc] init];
            [self.viewController.navigationController pushViewController:controller animated:YES];
        } else if ([dItem.itemId isEqualToString:@"1"]) {
            MixedDataViewController *controller = [[MixedDataViewController alloc] init];
            [self.viewController.navigationController pushViewController:controller animated:YES];
        }  else if ([dItem.itemId isEqualToString:@"2"]) {
//            UIStoryboard *mainStory = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//            GridBoardViewController *controller = [mainStory instantiateViewControllerWithIdentifier:@"GridBoardViewController"];
            GridBoardViewController *controller = [[GridBoardViewController alloc] init];
            [self.viewController.navigationController pushViewController:controller animated:YES];
        }
    }
    
    NSLog(@"--didSelectItemAtIndex %ld %@", (long)index, dItem.itemId);
}

@end
