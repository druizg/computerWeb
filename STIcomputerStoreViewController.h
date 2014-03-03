//
//  STIcomputerStoreViewController.h
//  computer
//
//  Created by chuck davila rios on 01/03/14.
//  Copyright (c) 2014 chuck davila rios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STIComputerStoreModel.h"

#define DESKTOP_COMPUTER_SECTION 0
#define LAPTOP_COMPUTER_SECTION 1
#define OTHER_COMPUTER_SECTION 2

@interface STIcomputerStoreViewController : UITableViewController

@property (strong, nonatomic) STIComputerStoreModel * model;

-(id) initWithModel:(STIComputerStoreModel *) aModel
              style:(UITableViewStyle) aStyle;

@end
