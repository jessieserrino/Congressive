//
//  InformationTableViewCell.h
//  Congressive
//
//  Created by Jessie Serrino on 5/14/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Politician.h"

@interface InformationTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIButton *phoneButton;
@property (nonatomic, strong) IBOutlet UIButton *emailButton;
@property (nonatomic, strong) IBOutlet UIButton *linkButton;

- (void) prepareWithPolitician: (Politician *) politician;

@end
