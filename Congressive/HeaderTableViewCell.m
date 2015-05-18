//
//  HeaderTableViewCell.m
//  Congressive
//
//  Created by Jessie Serrino on 5/14/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "HeaderTableViewCell.h"

@interface HeaderTableViewCell ()

@property (nonatomic, strong) Politician *politician;


@end

@implementation HeaderTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) prepareWithPolitician: (Politician *) politician
{
    self.politician = politician;
}

- (IBAction)facebookButtonPushed:(id)sender
{

}

- (IBAction)twitterButtonPushed:(id)sender
{
    
}

- (IBAction)youtubeButtonPushed:(id)sender
{
    
}

@end
