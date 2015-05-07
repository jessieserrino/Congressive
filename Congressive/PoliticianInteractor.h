//
//  PoliticianManager.h
//  Congressive
//
//  Created by Jessie Serrino on 5/3/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface PoliticianInteractor : NSObject

@property (nonatomic, strong) NSArray *politicians;

+ (instancetype) sharedInteractor;
- (BOOL) politiciansWithData: (NSDictionary *) data;


@end
