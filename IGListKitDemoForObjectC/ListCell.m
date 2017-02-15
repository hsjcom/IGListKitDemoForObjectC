//
//  ListCell.m
//  IGListKitDemoForObjectC
//
//  Created by Soldier on 2017/2/14.
//  Copyright © 2017年 Shaojie Hong. All rights reserved.
//

#import "ListCell.h"

@implementation ListCell

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
    _textLabel = [UILabel new];
    _textLabel.frame = self.bounds;
    _textLabel.textColor = COLOR_G1;
    [self.contentView addSubview:self.textLabel];
    
    _contentLabel = [UILabel new];
    _contentLabel.frame = self.bounds;
    _contentLabel.textColor = COLOR_G3;
    _contentLabel.numberOfLines = 0;
    [self.contentView addSubview:self.contentLabel];
    
    UIView *separator = [UIView new];
    separator.backgroundColor = COLOR_G4;
    separator.frame = CGRectMake(0, self.height - 0.5, self.width, 0.5);
    [self.contentView addSubview:separator];
    
    __weak __typeof__(self) weakSelf = self;
    
    //自动计算高度，设置autoLayout
    
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(@(10));
        make.width.mas_equalTo(@(UI_SCREEN_WIDTH - 20));
        make.height.mas_equalTo(@(40));
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@(10));
        make.top.mas_equalTo(weakSelf.textLabel.mas_bottom).offset(10);
        make.width.mas_equalTo(@(UI_SCREEN_WIDTH - 20));
        make.height.greaterThanOrEqualTo(@(0)).priority(1000);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@(0));
        make.width.mas_equalTo(@(UI_SCREEN_WIDTH));
        make.bottom.mas_equalTo(weakSelf.contentLabel.mas_bottom).offset(10);;
    }];
    
    [separator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.height.offset(0.5);
    }];
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

- (void)layoutSubviews {
    [super layoutSubviews];
}

//自动计算高度，重写优先约束属性
- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [self setNeedsLayout];
    [self layoutIfNeeded];
    CGSize size = [self.contentView systemLayoutSizeFittingSize:layoutAttributes.size]; //获取自适应size
    CGRect newFrame = layoutAttributes.frame;
    newFrame.size.height = size.height;
    newFrame.size.width = size.width;
    layoutAttributes.frame = newFrame;
    return layoutAttributes;
}

@end
