//
//  ViewController.m
//  RestExample
//
//  Created by Jesus Cagide on 6/28/15.
//  Copyright © 2015 Vimo. All rights reserved.
//

#import "ViewController.h"
#import "IRestServiceProtocol.h"
#import "RestService.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.restServiceProtol = [RestService new];
}

- (IBAction)cmd_refreshing:(id)sender {

    NSString *url = @"URL";
    NSDictionary *parameters = [NSDictionary dictionary];

    [self.restServiceProtol callURL:url withParameters:parameters withCallBack:^(id response) {
        int i = 0;
    }];

}

@end
