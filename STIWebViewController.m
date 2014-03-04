//
//  STIWebViewController.m
//  computer
//
//  Created by chuck davila rios on 28/02/14.
//  Copyright (c) 2014 chuck davila rios. All rights reserved.
//

#import "STIWebViewController.h"
#import "STIcomputerStoreViewController.h"


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
    
    
    //Alta en notificacion
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self
               selector:@selector(computerDidChanged:)
                   name:NEW_COMPUTER_NOTIFICATION_NAME
                 object:nil];
    
}

-(void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    
    //baja en notificacion
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void) computerDidChanged:(NSNotification *) notification
{
    NSDictionary *dict = [notification userInfo];
    
    STIcomputerModel *newComputer = [dict objectForKey:COMPUTER_KEY];
    
    self.model = newComputer;
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
