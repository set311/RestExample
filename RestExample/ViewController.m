//
//  ViewController.m
//  RestExample
//
//  Created by Jesus Cagide on 6/28/15.
//  Copyright © 2015 Vimo. All rights reserved.
//

#import "ViewController.h"
#import "IRestServiceProtocol.h"
#import "RestServiceAsync.h"

@interface ViewController ()
@property(nonatomic, copy) void (^callback)();
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    RestService *restService = [RestServiceAsync new];
    [restService setMessageRepresentationHandler: self];

    self.restServiceProtol = restService;
}

- (IBAction)cmd_refreshing:(id)sender {

    NSString *url = @"https://www.pademobile.com:50/ws/util.py/paises";
    NSDictionary *parameters = [NSDictionary dictionary];

    [self.restServiceProtol callURL:url withParameters:parameters withCallBack:^(id response) {
        NSLog(@"Response: %@", response);
        [[self refreshControl] endRefreshing];
    }];

}

- (void)showRetryTransferAlertViewWithBlock:(void (^)(void))callbackBlock {
    self.callback = callbackBlock;
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Retry"
                                                         message:@"Are you sure?"
                                                        delegate:self
                                               cancelButtonTitle:@"Ok"
                                               otherButtonTitles:@"Retry", nil];
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex) {
        self.callback();
    } else {
        [[self refreshControl] endRefreshing];
    }
}


@end
