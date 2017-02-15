//
//  GridCell.m
//  IGListKitDemoForObjectC
//
//  Created by Soldier on 2017/2/15.
//  Copyright © 2017年 Shaojie Hong. All rights reserved.
//

#import "GridCell.h"

@implementation GridCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.backgroundColor = [UIColor whiteColor];
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    _contentLabel = [UILabel new];
    _contentLabel.frame = self.bounds;
    _contentLabel.font = [UIFont boldSystemFontOfSize:20];
    _contentLabel.textColor = [UIColor whiteColor];
    _contentLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.contentLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _contentLabel.frame = self.bounds;
}

- (void)updateWithObject:(NSObject *)object {
    if (self.item != object) {
        if ([object isKindOfClass:[GridItem class]]) {
            self.item = (GridItem *)object;
            
            self.contentLabel.backgroundColor = self.item.color;
            if (self.item.title.length > 0) {
                self.contentLabel.text = self.item.title;
            }
        }
    }
}


@end
