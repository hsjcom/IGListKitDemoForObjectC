//
//  ListViewController.m
//  IGListKitDemoForObjectC
//
//  Created by Soldier on 2017/2/14.
//  Copyright © 2017年 Shaojie Hong. All rights reserved.
//

#import "ListViewController.h"
#import "DemoItem.h"
#import "ListSectionController.h"

@interface ListViewController ()<IGListAdapterDataSource, IGListAdapterDelegate>

@property (nonatomic, strong) IGListCollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *listAdapter;
@property (nonatomic, strong) NSArray <DemoItem *> *items;

@property (nonatomic, assign) BOOL loading;

@end




@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"List";
    
    [self data];
    
    [self setupCollectionView];
    [self setupListAdapter];
}

- (void)data {
    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 50; i ++) {
        DemoItem *item = [DemoItem initWithTitle:[NSString stringWithFormat:@"%d", i]];
        if (i % 3 == 0) {
            item.content = @"Aenean lacinia bibendum nulla sed consectetur. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mattis consectetur purus sit amet fermentum.Donec sed odio dui. Donec id elit non mi porta gravida at eget metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed posuere consectetur est at lobortis. Cras justo odio, dapibus ac facilisis in, egestas eget quam.";
        }
        
        [temp addObject:item];
    }
    _items = [NSArray arrayWithArray:temp];
}

- (void)setupCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.estimatedItemSize = CGSizeMake(UI_SCREEN_WIDTH, 50);
    self.collectionView = [[IGListCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.frame = self.view.bounds;
    [self.view addSubview:self.collectionView];
}

- (void)setupListAdapter {
    IGListAdapterUpdater *updater = [[IGListAdapterUpdater alloc] init];
    self.listAdapter = [[IGListAdapter alloc] initWithUpdater:updater
                                               viewController:self
                                             workingRangeSize:0];
    self.listAdapter.collectionView = self.collectionView;
    self.listAdapter.dataSource = self;
    self.listAdapter.delegate = self;
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.items;
}

- (IGListSectionController<IGListSectionType> *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    
    return [[ListSectionController alloc] init];
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

#pragma mark - IGListAdapterDelegate

- (void)listAdapter:(IGListAdapter *)listAdapter willDisplayObject:(id)object atIndex:(NSInteger)index {
}

- (void)listAdapter:(IGListAdapter *)listAdapter didEndDisplayingObject:(id)object atIndex:(NSInteger)index {
}

@end
