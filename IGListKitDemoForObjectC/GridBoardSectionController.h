//
//  GridBoardSectionController.h
//  IGListKitDemoForObjectC
//
//  Created by Soldier on 2017/2/16.
//  Copyright © 2017年 Shaojie Hong. All rights reserved.
//

#import <IGListKit/IGListKit.h>

@class GridBoardSectionController;

@protocol GridBoardSectionControllerDelegate <NSObject>

- (void)removeSectionControllerWantsRemoved:(GridBoardSectionController *)sectionController;

@end




@interface GridBoardSectionController : IGListSectionController<IGListSectionType>

@property (nonatomic, weak) id<GridBoardSectionControllerDelegate> delegate;

@end
