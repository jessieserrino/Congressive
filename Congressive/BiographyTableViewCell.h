//
//  BiographyTableViewCell.h
//  Congressive
//
//  Created by Jessie Serrino on 5/24/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailCellProtocol.h"

@interface BiographyTableViewCell : UITableViewCell <DetailCellProtocol>

@property (nonatomic) CGFloat specialHeight;


- (void)prepareWithPolitician:(Politician *)politician;

@end
