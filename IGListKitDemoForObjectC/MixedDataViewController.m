//
//  MixedDataViewController.m
//  IGListKitDemoForObjectC
//
//  Created by Soldier on 2017/2/14.
//  Copyright © 2017年 Shaojie Hong. All rights reserved.
//

#import "MixedDataViewController.h"
#import "DemoItem.h"
#import "GridSectionController.h"
#import "ExpandableSectionController.h"
#import "DemoSectionController.h"


@interface MixedDataViewController ()<IGListAdapterDataSource, IGListAdapterDelegate>

@property (nonatomic, strong) IGListCollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *listAdapter;
@property (nonatomic, strong) NSArray <DemoItem *> *items;
@property (nonatomic, strong) NSArray *segments;
@property (nonatomic, assign) NSInteger segmentIndex;

@end



@implementation MixedDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Mixed Data Demo";
    
    [self data];
    
    [self setupCollectionView];
    [self setupListAdapter];
    
    [self segmentControl];
    
    _segmentIndex = 0;
}

- (void)data {
    _items = @[@"Maecenas faucibus mollis interdum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.",
                      [GridItem initWithColor:RGBCOLOR(237, 73, 86) itemId:@"2" itemCount:6],
                      [DemoItem initWithTitle:@"Ryan Olson" itemId:@"3"],
                      [DemoItem initWithTitle:@"Oliver Rickard" itemId:@"4"],
                      [DemoItem initWithTitle:@"Jesse Squires" itemId:@"5"],
                      [GridItem initWithColor:RGBCOLOR(56, 151, 240) itemId:@"6" itemCount:9],
                      @"Nullam quis risus eget urna mollis ornare vel eu leo. Praesent commodo cursus magna, vel scelerisque nisl consectetur et.",
                      [GridItem initWithColor:RGBCOLOR(112, 192, 80) itemId:@"8" itemCount:5], [DemoItem initWithTitle:@"Ryan Nystrom" itemId:@"9"],
                      [DemoItem initWithTitle:@"Oliver Rickard" itemId:@"4"],];
    
    _segments = @[@"All", @"Colors", @"Text", @"Users"];
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

- (void)segmentControl {
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:_segments];
    segmentControl.frame = CGRectMake(self.view.frame.size.width * 0.5 - 60, 25, 200, 28);
    segmentControl.selectedSegmentIndex = 0;
    [segmentControl addTarget:self action:@selector(didClickSegmentedControlAction:)forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = segmentControl;
}

- (void)didClickSegmentedControlAction:(UISegmentedControl *)segmentControl {
    NSInteger idx = segmentControl.selectedSegmentIndex;
    _segmentIndex = idx;
    [self.listAdapter performUpdatesAnimated:YES completion:^(BOOL finished) {
    }];
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:0];
    if (_segmentIndex == 1) {
        for (NSObject *obj in self.items) {
            if ([obj isKindOfClass:[GridItem class]]) {
                [temp addObject:obj];
            }
        }
    } else if (_segmentIndex == 2) {
        for (NSObject *obj in self.items) {
            if ([obj isKindOfClass:[NSString class]]) {
                [temp addObject:obj];
            }
        }
    } else if (_segmentIndex == 3) {
        for (NSObject *obj in self.items) {
            if ([obj isKindOfClass:[DemoItem class]]) {
                [temp addObject:obj];
            }
        }
    } else {
        [temp addObjectsFromArray:self.items];
    }
    return temp;
}

- (IGListSectionController<IGListSectionType> *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    
    if ([object isKindOfClass:[NSString class]]) {
        return [[ExpandableSectionController  alloc] init];
    } else if ([object isKindOfClass:[GridItem class]]) {
        return [[GridSectionController alloc] init];
    } else {
        return [[DemoSectionController alloc] init];
    }
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
