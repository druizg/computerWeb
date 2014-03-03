//
//  STIcomputerViewController.h
//  computer
//
//  Created by chuck davila rios on 28/02/14.
//  Copyright (c) 2014 chuck davila rios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STIcomputerModel.h"

@interface STIcomputerViewController : UIViewController

@property (strong, nonatomic) STIcomputerModel * model;

@property (weak, nonatomic) IBOutlet UILabel * modelComputerLabel;
@property (weak, nonatomic) IBOutlet UILabel * computerCompanyLabel;
@property (weak, nonatomic) IBOutlet UILabel * typeLabel;
@property (weak, nonatomic) IBOutlet UILabel * inchesLabel;
@property (weak, nonatomic) IBOutlet UILabel * notesLabel;
@property (weak, nonatomic) IBOutlet UILabel * keybordLanguajeLabel;

@property (weak, nonatomic) IBOutlet UIImageView *photoImgView;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray * ratingViews;

-(id) initWithModel:(STIcomputerModel *) aModel;

-(IBAction)displayWeb:(id)sender;

@end
