//
//  STIWebViewController.h
//  computer
//
//  Created by chuck davila rios on 28/02/14.
//  Copyright (c) 2014 chuck davila rios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STIcomputerModel.h"

@interface STIWebViewController : UIViewController<UIWebViewDelegate>

@property (strong, nonatomic) STIcomputerModel * model;

@property (weak, nonatomic) IBOutlet UIWebView * webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView * spinner;

-(id) initWithModel:(STIcomputerModel *) aModel;

@end
