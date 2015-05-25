//
//  ContactTableViewCell.m
//  Congressive
//
//  Created by Jessie Serrino on 5/24/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "ContactTableViewCell.h"

static NSString * const noInformation = @"[No Available Information]";
static NSUInteger const buttonTotal = 3;
static NSUInteger const ButtonClickIndex = 0;
static NSUInteger const StringValueIndex = 1;
static NSUInteger const ImageNameIndex = 2;


@interface ContactTableViewCell() <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) Politician *politician;

@property (nonatomic, weak) IBOutlet UITableView *buttonTableView;
@property (nonatomic, weak) IBOutlet UIView *paperView;
@property (nonatomic, strong) NSMutableArray *contactButtons;


@end;

@implementation ContactTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    [self setupButtonTable];
}

- (void)prepareWithPolitician:(Politician *)politician
{
    _politician = politician;
    [self configureVisuals];
}


- (void) setupButtonTable
{
    [self.buttonTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    self.buttonTableView.delegate = self;
    self.buttonTableView.dataSource = self;
    self.contactButtons = [[NSMutableArray alloc] initWithCapacity:buttonTotal];
}

- (void) configureVisuals
{
    [self makeShadow];
    [self prepareContactButtons];
}

- (void) makeShadow
{
    self.paperView.layer.masksToBounds = NO;
    //    self.headerBackgroundView.layer.cornerRadius = 8; // rounded corners
    self.paperView.layer.shadowOffset = CGSizeMake(1, 1);
    self.paperView.layer.shadowRadius = 5;
    self.paperView.layer.shadowOpacity = 0.5;
}

- (void) prepareContactButtons
{
    if(!self.contactButtons.count)
    {
        if(self.politician.phoneNumber != nil)
            [self.contactButtons addObject: @[@(Phone), self.politician.phoneNumber, @"phone"]];
        if(self.politician.email != nil)
            [self.contactButtons addObject: @[@(Email), self.politician.email, @"mail"]];
        if(self.politician.website != nil)
            [self.contactButtons addObject: @[@(WebBrowser), self.politician.website.description, @"link"]];
        
        [self.buttonTableView reloadData];
    }
}

/* Necessary methods for contact table */

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contactButtons.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    NSUInteger index = indexPath.item;

    cell.imageView.image = [UIImage imageNamed: self.contactButtons[index][ImageNameIndex]];
    cell.textLabel.text = self.contactButtons[index][StringValueIndex];
    cell.textLabel.font = [UIFont fontWithName:@"Lao Sangam MN" size:14.0];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (self.buttonTableView.frame.size.height / self.contactButtons.count);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger index = indexPath.item;
    ExternalApplication app = [self.contactButtons[index][ButtonClickIndex] integerValue];
    [ExternalAppManager open:app WithPolitician:self.politician];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end
