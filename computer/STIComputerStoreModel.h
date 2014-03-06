//
//  STIComputerStoreModel.h
//  computer
//
//  Created by chuck davila rios on 01/03/14.
//  Copyright (c) 2014 chuck davila rios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STIcomputerModel.h"

#define DESKTOP_COMPUTER_KEY @"desktop"
#define LAPTOP_COMPUTER_KEY @"laptop"
#define OTHER_COMPUTHER_HEY @"other"

@interface STIComputerStoreModel : NSObject

@property (readonly, nonatomic) int desktopComputerCount;
@property (readonly, nonatomic) int laptopComputerCount;
@property (readonly, nonatomic) int otherComputerCount;

-(STIcomputerModel *) desktopComputerAtIndex: (int) index;
-(STIcomputerModel *) laptopComputerAtIndex: (int) index;
-(STIcomputerModel *) otherComputerAtIndex: (int) index;


@end
