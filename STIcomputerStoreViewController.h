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

#define NEW_COMPUTER_NOTIFICATION_NAME @"newComputer"
#define COMPUTER_KEY @"computer"

#define SECTION_KEY @"section"
#define ROW_KEY @"row"
#define LAST_COMPUTER_KEY @"last_computer"


@class STIcomputerStoreViewController;

@protocol computerStoreViewControllerDelegate <NSObject>

-(void) computerStoreViewController:(STIcomputerStoreViewController *) computerStoreVC
                     didSelectedComputer:(STIcomputerModel *) aComputer;

@end

@interface STIcomputerStoreViewController : UITableViewController

@property (strong, nonatomic) STIComputerStoreModel * model;
@property (weak, nonatomic) id<computerStoreViewControllerDelegate> delegate;

-(id) initWithModel:(STIComputerStoreModel *) aModel
              style:(UITableViewStyle) aStyle;

-(STIcomputerModel *) lastSelectedComputer;

@end
