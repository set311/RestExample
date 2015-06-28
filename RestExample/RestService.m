

#import <CommonCrypto/CommonHMAC.h>
#import "RestService.h"
#import "Reachability.h"



@implementation RestService

- (id)init
{

    self = [super init];
    if (self) {
        self.apiUrl      = @"https://www.pademobile.com";
    }

    return self;
}


- (void)__getFromURI:(NSString *)uri withParameters:(NSDictionary *)parameters withCallBack:(RESTCallBack)getCallBack
{
    Reachability  *reachabilityWithHostname = [Reachability reachabilityWithHostname:@"www.google.com"];
    
    NetworkStatus networkStatus = [reachabilityWithHostname currentReachabilityStatus];
    
    if (networkStatus != NotReachable) {
        
        NSString *stringURL = [self apiUrl];
        NSURL               *url     = [NSURL URLWithString:stringURL];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setTimeoutInterval:60];

        NSURLResponse *response = NULL;
        NSError       *error    = NULL;
        
        NSLog(@"request: %@ ", request);
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];

        if (!error && responseData) {
            NSError  *parsingError   = nil;
            id       decodedResponse = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&parsingError];
            NSString *stringResponse = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];

            if (!parsingError) {
            
                NSLog(@"response: %@", stringResponse);
                getCallBack(decodedResponse);
                
                return;
            } else {
                
                NSLog(@"Error [%@] response: %@", stringURL, stringResponse);

                getCallBack(@{
                        @"status" : @(NO),
                        @"message" : @"Error crítico, favor de intentar más tarde",
                        @"error" : @"Parsing error"
                });
                return;
            }
        }
        NSLog(@"Error [%@] response: %@", stringURL, error);
    }
    
    [self retryRequest:uri parameters:parameters getCallBack:getCallBack];
    NSLog(@"Error en la comunicacion con el servicio %@", uri);
}

- (void)retryRequest:(NSString *)uri parameters:(NSDictionary *)parameters getCallBack:(RESTCallBack)getCallBack
{
    [[self messageRepresentationHandler] showRetryTransferAlertViewWithBlock:^
    {
        [self __getFromURI:uri withParameters:parameters withCallBack:getCallBack];
    }];
}

@end