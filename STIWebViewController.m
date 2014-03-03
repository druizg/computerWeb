//
//  STIWebViewController.m
//  computer
//
//  Created by chuck davila rios on 28/02/14.
//  Copyright (c) 2014 chuck davila rios. All rights reserved.
//

#import "STIWebViewController.h"


@implementation STIWebViewController

-(id) initWithModel:(STIcomputerModel *) aModel
{
    if (self == [super initWithNibName:nil
                                bundle:nil	]) {
        _model = aModel;
        
        self.title = @"Web";
    }
    
    return self;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self displayURL: self.model.computerCompanyWeb];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Utils

-(void) displayURL:(NSURL *) anURL
{
    self.webView.delegate = self;
    
    self.spinner.hidden = NO;
    [self.spinner startAnimating];
    [self.webView loadRequest:[NSURLRequest requestWithURL:anURL]];
}


#pragma mark - UIWebViewDelegate

-(void) webViewDidFinishLoad:(UIWebView *)webView
{
    
    [self.spinner stopAnimating];
    [self.spinner setHidden:YES];

}

@end
