//
//  ContactTableViewCell.h
//  Congressive
//
//  Created by Jessie Serrino on 5/24/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailCellProtocol.h"

@interface ContactTableViewCell : UITableViewCell <DetailCellProtocol>

- (void)prepareWithPolitician:(Politician *)politician;

@end
