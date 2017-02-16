//
//  StoryBoardCell.m
//  IGListKitDemoForObjectC
//
//  Created by Soldier on 2017/2/16.
//  Copyright © 2017年 Shaojie Hong. All rights reserved.
//

#import "StoryBoardCell.h"

@interface StoryBoardCell ()

@end

@implementation StoryBoardCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.backgroundColor = [UIColor orangeColor];
        self.contentView.backgroundColor = [UIColor orangeColor];
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
    
    UIView *liner = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, 1)];
    liner.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:liner];
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
