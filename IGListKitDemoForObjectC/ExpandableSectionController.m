//
//  ExpandableSectionController.m
//  IGListKitDemoForObjectC
//
//  Created by Soldier on 2017/2/15.
//  Copyright © 2017年 Shaojie Hong. All rights reserved.
//

#import "ExpandableSectionController.h"
#import "LabelCell.h"

@interface ExpandableSectionController ()

@property (nonatomic, strong) NSObject *item;
@property (nonatomic, assign) BOOL expanded;

@end




@implementation ExpandableSectionController

#pragma mark - IGListSectionType

- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat height = [LabelCell collectionViewCellHeightForObject:self.item expanded:self.expanded];
    return CGSizeMake(self.collectionContext.containerSize.width, height);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    LabelCell *cell = [self.collectionContext dequeueReusableCellOfClass:[LabelCell class]
                                                   forSectionController:self
                                                                atIndex:index];
    [cell updateWithObject:self.item expanded:self.expanded];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.item = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    self.expanded = !self.expanded;
    [self.collectionContext reloadInSectionController:self atIndexes:[NSIndexSet indexSetWithIndex:0]];
}

@end
