//
//  PoliticianTableViewCell.m
//  Congressive
//
//  Created by Jessie Serrino on 5/1/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "PoliticianTableViewCell.h"
#import "ImageInteractor.h"

@interface PoliticianTableViewCell()




@end

@implementation PoliticianTableViewCell

- (IBAction)callButtonPressed:(UIButton *)sender {

    
}
- (IBAction)phoneButtonPressed:(id)sender {
//    NSString *phoneNumFiltered = [[self.politicianPhoneNumber componentsSeparatedByCharactersInSet:
//                            [[NSCharacterSet decimalDigitCharacterSet] invertedSet]]
//                           componentsJoinedByString:@""];
    NSString *phoneNumber = [NSString stringWithFormat: @"telprompt://%@", self.politicianPhoneNumber];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}

- (IBAction)linkButtonPressed:(id)sender {
    
    if (![[UIApplication sharedApplication] openURL:self.politicianWebsite]) {
        NSLog(@"%@%@",@"Failed to open url:",[self.politicianWebsite description]);
    }
}


- (void)awakeFromNib {
    // Initialization code
}


@end
