//
//  ViewController.m
//  Congressive
//
//  Created by Jessie Serrino on 5/1/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "DetailViewController.h"
#import "HeaderTableViewCell.h"
#import "InformationTableViewCell.h"


@interface DetailViewController ()
@property (strong, nonatomic) IBOutlet HeaderTableViewCell *headerCell;
@property (strong, nonatomic) IBOutlet InformationTableViewCell *informationCell;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setPolitician:(Politician *)politician
{
    _politician = politician;
    [self.headerCell prepareWithPolitician:self.politician];
    
}

@end
