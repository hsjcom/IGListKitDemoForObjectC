//
//  ListCell.h
//  IGListKitDemoForObjectC
//
//  Created by Soldier on 2017/2/14.
//  Copyright © 2017年 Shaojie Hong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DemoItem.h"

@interface ListCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) DemoItem *item;

- (void)updateWithObject:(NSObject *)object;

@end
