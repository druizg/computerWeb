//
//  STIcomputerViewController.m
//  computer
//
//  Created by chuck davila rios on 28/02/14.
//  Copyright (c) 2014 chuck davila rios. All rights reserved.
//

#import "STIcomputerViewController.h"
#import "STIWebViewController.h"

@implementation STIcomputerViewController


-(id) initWithModel:(STIcomputerModel *) aModel
{
    if ([super initWithNibName:nil bundle:nil]) {
        _model = aModel;
        
        self.title = self.model.modelComputer;
    }
    
    return self;
}


- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self syncModelWithView];
    /*
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:1
                                                                        green:1
                                                                         blue:1
                                                                        alpha:1];
    
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:0
                                                                              green:0
                                                                               blue:0
                                                                              alpha:1];*/
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.0
                                                                           green:0.5
                                                                            blue:0.0
                                                                           alpha:1];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBActions
-(IBAction)displayWeb:(id)sender
{
    //NSLog(@"Vamos a la URL: %@", self.model.computerCompanyWeb);
    
    //creamos un WeViewControler
    STIWebViewController *webVC = [[STIWebViewController alloc] initWithModel:self.model];
    //hacemos un push
    [self.navigationController pushViewController:webVC
                                         animated:YES];
}

#pragma mark - Utils
-(void) syncModelWithView
{
    self.modelComputerLabel.text = self.model.modelComputer;
    self.computerCompanyLabel.text = self.model.computerCompany;
    self.typeLabel.text = self.model.type;
    self.notesLabel.text = self.model.notes;
    self.inchesLabel.text = [NSString stringWithFormat:@"%d", self.model.inches ] ;
    self.keybordLanguajeLabel.text = [self arrayToString: self.model.keybordLanguaje];
    
    [self displayRating:self.model.rating];
    [self changePhoto:self.model.type];
}

-(void) clearPhoto
{
    self.photoImgView.image = nil;
}

-(void) changePhoto:(NSString *) aType
{
    //UIImage * photoImg = nil;
    NSString * imgNameToPhoto = ( [[aType lowercaseString]  isEqual: @"laptop"])? @"laptop-computer.jpg" : @"desktop-computer.jpg";
    
    UIImage *photoImg = [UIImage imageNamed:imgNameToPhoto];
    
    [self.photoImgView setImage:photoImg];
}

-(void) clearRating{
    for(UIImageView *imgView in self.ratingViews){
        imgView.image = nil;
    }
}

-(void) displayRating:(int) aRating
{
    [self clearRating];
    
    UIImage * star = [UIImage imageNamed:@"star_gold_256"];
    
    for (int x=0; x < aRating; x++) {
        [[self.ratingViews objectAtIndex:x] setImage:star];
    }
}

-(NSString *) arrayToString:(NSArray *) arrayKeybordLanguajes
{
    NSString * repr = nil;
    
    if ([arrayKeybordLanguajes count] == 1) {
        repr = [ @"Disponible al 99% en: " stringByAppendingString: [arrayKeybordLanguajes lastObject]];
    }else{
        repr = [[arrayKeybordLanguajes componentsJoinedByString:@","] stringByAppendingString:@"."];
    }
    
    return repr;
}


#pragma mark - UISplitViewControllerDelegate
-(void) splitViewController:(UISplitViewController *)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem *)barButtonItem
       forPopoverController:(UIPopoverController *)pc
{
    self.navigationItem.rightBarButtonItem = barButtonItem;
}

-(void) splitViewController:(UISplitViewController *)svc
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    self.navigationItem.rightBarButtonItem = nil;
}


#pragma mark - computerStoreViewControllerDelegate

-(void) computerStoreViewController:(STIcomputerStoreViewController *) computerStoreVC
                didSelectedComputer:(STIcomputerModel *) aComputer
{
    self.model = aComputer;
    self.title = aComputer.modelComputer;
    
    [self syncModelWithView];
}


@end
