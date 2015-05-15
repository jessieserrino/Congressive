//
//  HeaderTableViewCell.h
//  Congressive
//
//  Created by Jessie Serrino on 5/14/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Politician.h"


@interface HeaderTableViewCell : UITableViewCell

- (void) prepareWithPolitician: (Politician *) politician;


@end
