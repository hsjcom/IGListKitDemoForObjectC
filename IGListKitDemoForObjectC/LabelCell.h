//
//  LabelCell.h
//  IGListKitDemoForObjectC
//
//  Created by Soldier on 2017/2/15.
//  Copyright © 2017年 Shaojie Hong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabelCell : UICollectionViewCell

- (void)updateWithObject:(NSObject *)object expanded:(BOOL)expanded;

+ (CGFloat)collectionViewCellHeightForObject:(id)object expanded:(BOOL)expanded;

@end
