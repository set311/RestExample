//
//  ViewController.h
//  RestExample
//
//  Created by Jesus Cagide on 6/28/15.
//  Copyright © 2015 Vimo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMessageRepresentationHandler.h"

@protocol IRestServiceProtocol;

@interface ViewController : UITableViewController <IMessageRepresentationHandler, UIAlertViewDelegate>


@property(nonatomic, strong) id<IRestServiceProtocol> restServiceProtol;

@end

