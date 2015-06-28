//
//  ViewController.h
//  RestExample
//
//  Created by Jesus Cagide on 6/28/15.
//  Copyright © 2015 Vimo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IRestServiceProtocol;

@interface ViewController : UITableViewController


@property(nonatomic, strong) id<IRestServiceProtocol> restServiceProtol;

@end

