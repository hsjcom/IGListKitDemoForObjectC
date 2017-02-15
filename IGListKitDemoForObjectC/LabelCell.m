//
//  LabelCell.m
//  IGListKitDemoForObjectC
//
//  Created by Soldier on 2017/2/15.
//  Copyright © 2017年 Shaojie Hong. All rights reserved.
//

#import "LabelCell.h"

@interface LabelCell ()

@property (nonatomic, strong) NSString *item;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIView *separator;
@property (nonatomic, assign) BOOL expanded;

@end



@implementation LabelCell

+ (CGFloat)collectionViewCellHeightForObject:(id)object expanded:(BOOL)expanded {
    if (!expanded) {
        return 10 + 30 + 10;
    }
    NSString *str = (NSString *)object;
    CGSize size = [str boundingRectWithSize:CGSizeMake(UI_SCREEN_WIDTH - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:22]} context:nil].size;
    return 10 + size.height + 10;;
}

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
    _contentLabel.font = [UIFont systemFontOfSize:22];
    _contentLabel.textColor = COLOR_G1;
    _contentLabel.numberOfLines = 1;
    [self.contentView addSubview:self.contentLabel];
    
    _separator = [UIView new];
    _separator.backgroundColor = COLOR_G4;
    _separator.frame = CGRectMake(0, self.height - 0.5, self.width, 0.5);
    [self.contentView addSubview:_separator];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGSize size = CGSizeMake(self.width - 20, 30);
    if (self.expanded) {
        size = [self.item boundingRectWithSize:CGSizeMake(self.width - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : _contentLabel.font} context:nil].size;
    }
    _contentLabel.frame = CGRectMake(10, 10, size.width, size.height);
    
    _separator.frame = CGRectMake(0, self.height - 0.5, self.width, 0.5);
}

- (void)updateWithObject:(NSObject *)object expanded:(BOOL)expanded {
    if (self.item != object) {
        if ([object isKindOfClass:[NSString class]]) {
            self.item = (NSString *)object;
            
            self.expanded = expanded;
            self.contentLabel.numberOfLines = expanded ? 0 : 1;
            self.contentLabel.text = self.item;
        }
    }
}

@end
