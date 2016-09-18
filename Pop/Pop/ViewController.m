//
//  ViewController.m
//  Pop
//
//  Created by 朱星 on 16/9/18.
//  Copyright © 2016年 zhuxing. All rights reserved.
//

#import "ViewController.h"
#import "pop.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    [self decayAnimation];
    [self createTime];

}

-(void)decayAnimation {
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(20, 150, 100, 100)];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor redColor];
    
    POPDecayAnimation * decayAnimation = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    decayAnimation.velocity = @550;
    //衰减
    decayAnimation.deceleration = 0.998;
    [view.layer pop_addAnimation:decayAnimation forKey:nil];
    
    
}

- (void)createTime {
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 200, 300, 50)];
    [self.view addSubview:label];
    label.text = @"00:00:000";
    POPAnimatableProperty *property = [POPAnimatableProperty propertyWithName:@"zhuxing.Pop" initializer:^(POPMutableAnimatableProperty *prop) {
       prop.writeBlock = ^(id obj,const CGFloat values[]) {
           label.text = [NSString stringWithFormat:@"%02ld:%02ld:%ld", (NSInteger)values[0] / 60,(NSInteger)(values[0]) % 60,(NSInteger)(values[0] * 100) % 100];
        };
        
    
//           label.text = [NSString stringWithFormat:@"%f",values[0]];
//       };
        //设置刷新频率
        prop.threshold = 0.01f;
    }];
    
    
    POPBasicAnimation * linearAnimation = [POPBasicAnimation linearAnimation];
//    property  财产
    linearAnimation.property = property;
    linearAnimation.fromValue = @0;
    linearAnimation.toValue = @(3*60);
    linearAnimation.duration = 3*60;
    
    linearAnimation.beginTime = CACurrentMediaTime() + 1;
    [label pop_addAnimation:linearAnimation forKey:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    cell.textLabel.font = [UIFont systemFontOfSize:32];
    cell.textLabel.text = @"holle,world";
    return cell;
}

@end
