//
//  GridBoardViewController.m
//  IGListKitDemoForObjectC
//
//  Created by Soldier on 2017/2/16.
//  Copyright © 2017年 Shaojie Hong. All rights reserved.
//

#import "GridBoardViewController.h"
#import "DemoItem.h"
#import "GridBoardSectionController.h"

@interface GridBoardViewController ()<IGListAdapterDataSource, GridBoardSectionControllerDelegate>

@property (nonatomic, strong) IGListCollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *listAdapter;
@property (nonatomic, strong) NSArray <DemoItem *> *items;

@end





@implementation GridBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Grid Board Demo";
    
    [self data];
    
    [self setupCollectionView];
    [self setupListAdapter];
}

- (void)data {
    NSArray *user = @[@"Littlefinger", @"Tommen Baratheon", @"Brienne of Tarth", @"Bronn", @"Gilly", @"Theon Greyjoy", @"Jaqen H'ghar", @"Cersei Lannister", @"Jaime Lannister", @"Tyrion Lannister", @"Melisandre", @"Missandei", @"Jorah Mormont", @"Khal Moro", @"Arya Stark", @"Tywin Lannister", @"The Hound", @"Varys", @"Hodor", @"Margaery Tyrell"];
    
    int i = 0;
    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:0];
    for (NSString *str in user) {
        GridItem *grid = [[GridItem alloc] init];
        grid.itemId = [NSString stringWithFormat:@"%d", i];
        grid.title = str;
        grid.color = COLOR_C1;
        
        [temp addObject:grid];
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
}


#pragma mark - IGListAdapterDataSource

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.items;
}

- (IGListSectionController<IGListSectionType> *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    
    GridBoardSectionController *sectionController = [[GridBoardSectionController alloc] init];
    sectionController.delegate = self;
    
    return sectionController;
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

#pragma mark - GridBoardSectionControllerDelegate

- (void)removeSectionControllerWantsRemoved:(GridBoardSectionController *)sectionController {
    NSInteger section = [self.listAdapter sectionForSectionController:sectionController];
    NSMutableArray *temp = [NSMutableArray arrayWithArray:self.items];
    [temp removeObjectAtIndex:section];
    self.items = temp;
    
    [self.listAdapter performUpdatesAnimated:YES completion:^(BOOL finished) {
    }];
}


@end
