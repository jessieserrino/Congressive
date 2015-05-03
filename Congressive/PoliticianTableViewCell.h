//
//  PoliticianTableViewCell.h
//  Congressive
//
//  Created by Jessie Serrino on 5/1/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PoliticianTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *politicianImageView;
@property (strong, nonatomic) IBOutlet UILabel *politicianNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *politicianDescriptorLabel;
@property (strong, nonatomic) IBOutlet UILabel *politicianPartyLabel;

@end
