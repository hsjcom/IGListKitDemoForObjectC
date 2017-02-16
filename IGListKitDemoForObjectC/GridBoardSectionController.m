//
//  GridBoardSectionController.m
//  IGListKitDemoForObjectC
//
//  Created by Soldier on 2017/2/16.
//  Copyright © 2017年 Shaojie Hong. All rights reserved.
//

#import "GridBoardSectionController.h"
#import "DemoItem.h"
#import "StoryBoardCell.h"

@interface GridBoardSectionController ()

@property (nonatomic, strong) GridItem *item;

@end





@implementation GridBoardSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.minimumInteritemSpacing = 2;
        self.minimumLineSpacing = 2;
    }
    return self;
}

#pragma mark - IGListSectionType

- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
//    CGFloat itemSize = self.item.title.length * 7;
    return CGSizeMake(UI_SCREEN_WIDTH, 60);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    StoryBoardCell *cell = [self.collectionContext dequeueReusableCellOfClass:[StoryBoardCell class]
                            forSectionController:self
                            atIndex:index];
//    [self.collectionContext dequeueReusableCellFromStoryboardWithIdentifier:@"Cell" forSectionController:self atIndex:index];
    [cell updateWithObject:self.item];
                            
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.item = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    if (self.delegate && [self.delegate respondsToSelector:@selector(removeSectionControllerWantsRemoved:)]) {
        [self.delegate removeSectionControllerWantsRemoved:self];
    }
}


@end
