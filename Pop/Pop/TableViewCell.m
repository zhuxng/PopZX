//
//  TableViewCell.m
//  Pop
//
//  Created by 朱星 on 16/9/18.
//  Copyright © 2016年 zhuxing. All rights reserved.
//

#import "TableViewCell.h"
#import "pop.h"

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    if (highlighted) {
        //放大效果
        POPBasicAnimation * scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1.2, 1.2)];
        scaleAnimation.duration = 0.1;
        [self.textLabel pop_addAnimation:scaleAnimation forKey:nil];
    }
    else {
        POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        springAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(0.9, 0.9)];
        springAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
        springAnimation.springBounciness = 20;
        [self.textLabel pop_addAnimation:springAnimation forKey:nil];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
