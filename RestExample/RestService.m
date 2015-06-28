#import <CommonCrypto/CommonHMAC.h>
#import "RestService.h"
#import "Reachability.h"


@implementation RestService

- (void)callURL:(NSString *)URL
 withParameters:(NSDictionary *)parameters
   withCallBack:(RESTCallBack)getCallBack {

    NetworkStatus networkStatus = [[Reachability reachabilityWithHostname:@"www.google.com"] currentReachabilityStatus];

    if (networkStatus != NotReachable) {

        NSURL *url = [NSURL URLWithString:URL];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setTimeoutInterval:60];

        NSURLResponse *response = NULL;
        NSError *error = NULL;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];

        if (!error && responseData) {
            NSError *parsingError = nil;
            id decodedResponse = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&parsingError];
            if (!parsingError) {
                getCallBack(decodedResponse);
            } else {
                getCallBack(@{
                        @"status" : @(NO),
                        @"message" : @"Error crítico, favor de intentar más tarde",
                        @"error" : @"Parsing error"
                });
            }
            return;
        }
        NSLog(@"Error [%@] response: %@", [self apiUrl], error);
    }

    [self retryRequest:URL parameters:parameters getCallBack:getCallBack];
}

- (void)retryRequest:(NSString *)uri
          parameters:(NSDictionary *)parameters
         getCallBack:(RESTCallBack)getCallBack {

    [[self messageRepresentationHandler] showRetryTransferAlertViewWithBlock:^{
        [self callURL:uri withParameters:parameters withCallBack:getCallBack];
    }];

}

@end