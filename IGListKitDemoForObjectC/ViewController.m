//
//  ViewController.m
//  IGListKitDemoForObjectC
//
//  Created by Soldier on 2017/2/13.
//  Copyright © 2017年 Shaojie Hong. All rights reserved.
//

#import "ViewController.h"
#import "DemoItem.h"
#import "DemoSectionController.h"


@interface ViewController () <IGListAdapterDataSource, IGListAdapterDelegate>

@property (nonatomic, strong) IGListCollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *listAdapter;
@property (nonatomic, strong) NSArray <DemoItem *> *items;

@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"IGListKitDemoForObjectC";
    
    [self data];
    
    [self setupCollectionView];
    [self setupListAdapter];
}

- (void)data {
    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 30; i ++) {
        NSString *itemId = [NSString stringWithFormat:@"%d", i];
        DemoItem *item = [DemoItem initWithTitle:itemId itemId:itemId];
        if (i == 0) {
            item.content = @"List Data Demo";
        } else if (i == 1) {
            item.content = @"Mixed Data Demo";
        }
        
        [temp addObject:item];
    }
    _items = [NSArray arrayWithArray:temp];
}

- (void)setupCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
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
    
    return [[DemoSectionController alloc] init];
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

#pragma mark - IGListAdapterDelegate

- (void)listAdapter:(IGListAdapter *)listAdapter willDisplayObject:(id)object atIndex:(NSInteger)index {
}

- (void)listAdapter:(IGListAdapter *)listAdapter didEndDisplayingObject:(id)object atIndex:(NSInteger)index {
    // Do nothing
}

@end
