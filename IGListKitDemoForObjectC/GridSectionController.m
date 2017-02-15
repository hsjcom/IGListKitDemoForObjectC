//
//  GridSectionController.m
//  IGListKitDemoForObjectC
//
//  Created by Soldier on 2017/2/15.
//  Copyright © 2017年 Shaojie Hong. All rights reserved.
//

#import "GridSectionController.h"
#import "DemoItem.h"
#import "GridCell.h"

@interface GridSectionController ()

@property (nonatomic, strong) GridItem *item;

@end




@implementation GridSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.minimumInteritemSpacing = 1;
        self.minimumLineSpacing = 1;
    }
    return self;
}

#pragma mark - IGListSectionType

- (NSInteger)numberOfItems {
    return self.item ? self.item.itemCount : 0;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = self.collectionContext.containerSize.width;
    CGFloat itemSize = floor(width / 4);
    return CGSizeMake(itemSize, itemSize);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    GridCell *cell = [self.collectionContext dequeueReusableCellOfClass:[GridCell class]
                                                    forSectionController:self
                                                                 atIndex:index];
    [cell updateWithObject:self.item];
    cell.contentLabel.text = [NSString stringWithFormat:@"%ld", (long)index];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.item = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
}


@end
