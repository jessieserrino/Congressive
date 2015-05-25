//
//  BiographyTableViewCell.m
//  Congressive
//
//  Created by Jessie Serrino on 5/24/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "BiographyTableViewCell.h"
#import "BiographyProvider.h"

@interface BiographyTableViewCell()

@property (nonatomic, strong) Politician *politician;


@property (nonatomic, weak) IBOutlet UIView *paperView;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *spinningWheel;
@property (nonatomic, weak) IBOutlet UILabel *biographyTextLabel;

@end

@implementation BiographyTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)prepareWithPolitician:(Politician *)politician
{
    _politician = politician;
    
    [self configureBiographyInformation];
    [self makeShadow];
}

- (void) makeShadow
{
    self.paperView.layer.masksToBounds = NO;
    //    self.headerBackgroundView.layer.cornerRadius = 8; // rounded corners
    self.paperView.layer.shadowOffset = CGSizeMake(1, 1);
    self.paperView.layer.shadowRadius = 5;
    self.paperView.layer.shadowOpacity = 0.5;
}

- (void) configureBiographyInformation
{
    if(!self.politician.biography)
    {
        [[BiographyProvider sharedProvider] loadBiographyWithPolitician: self.politician
                                                             completion: ^(NSString * bio){
                                                                 [self adjustCellSizeWithBio:bio];
                                                                 self.politician.biography = bio;
                                                             }
                                                                  error: ^(NSString *errorText, NSError *error){
                                                                      [self adjustCellSizeWithBio:errorText];
                                                                  }];
    }
    else
    {
        [self adjustCellSizeWithBio:self.politician.biography];
    }
}


- (void) adjustCellSizeWithBio: (NSString *) bio
{
    self.spinningWheel.hidden = YES;
    CGRect startingBounds = self.biographyTextLabel.bounds;
    self.biographyTextLabel.text = bio;
    [self.biographyTextLabel sizeToFit];
    
    CGRect endingBounds = self.biographyTextLabel.bounds;
    CGFloat expansion = endingBounds.size.height - startingBounds.size.height;
    
    
    self.specialHeight = self.bounds.size.height + expansion;
    
//    [self.tableView reloadData];
//    [self.tableView layoutIfNeeded];
}


@end
