//
//  PoliticianTableViewCell.m
//  Congressive
//
//  Created by Jessie Serrino on 5/1/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "PoliticianTableViewCell.h"

@interface PoliticianTableViewCell()




@end

@implementation PoliticianTableViewCell

- (IBAction)callButtonPressed:(UIButton *)sender {
    NSString *phoneNumber = [NSString stringWithFormat: @"telprompt://%lli", 8473099966];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
    
}
- (IBAction)websiteButtonPressed:(UIButton *)sender {
    NSString *website = [NSString stringWithFormat: @"http://google.com"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:website]];

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
