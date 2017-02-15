//
//  GridCell.h
//  IGListKitDemoForObjectC
//
//  Created by Soldier on 2017/2/15.
//  Copyright © 2017年 Shaojie Hong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DemoItem.h"

@interface GridCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) GridItem *item;

- (void)updateWithObject:(NSObject *)object;

@end




