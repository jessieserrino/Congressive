//
//  MapTableViewCell.h
//  Congressive
//
//  Created by Jessie Serrino on 5/25/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailCellProtocol.h"

@interface MapTableViewCell : UITableViewCell <DetailCellProtocol>

- (void)prepareWithPolitician:(FederalPolitician *)politician;

@end
