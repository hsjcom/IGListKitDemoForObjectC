//
//  DemoCell.m
//  IGListKitDemoForObjectC
//
//  Created by Soldier on 2017/2/14.
//  Copyright © 2017年 Shaojie Hong. All rights reserved.
//

#import "DemoCell.h"
#import "DemoItem.h"

@interface DemoCell ()

@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) DemoItem *item;

@end




@implementation DemoCell

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
    _contentLabel.frame = CGRectMake(10, 10, self.width - 20, 30);
    _contentLabel.textColor = COLOR_G1;
    [self.contentView addSubview:self.contentLabel];
    
    _textLabel = [UILabel new];
    _textLabel.frame = CGRectMake(10, _contentLabel.bottom, self.width - 20, 30);
    _textLabel.textColor = COLOR_G3;
    [self.contentView addSubview:self.textLabel];
    
    UIView *separator = [UIView new];
    separator.backgroundColor = COLOR_G4;
    separator.frame = CGRectMake(0, self.height - 1, self.width, 1);
    [self.contentView addSubview:separator];
}

- (void)updateWithObject:(NSObject *)object {
    if (self.item != object) {
        if ([object isKindOfClass:[DemoItem class]]) {
            self.item = (DemoItem *)object;
            self.textLabel.text = [NSString stringWithFormat:@"IGListKitDemoForObjectC %@", self.item.title];
            self.contentLabel.text = self.item.content;
        }
    }
}

@end
