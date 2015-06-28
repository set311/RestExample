#import "RestServiceAsync.h"

@interface RestServiceAsync ()

@property(nonatomic) dispatch_queue_t queue;

@end

@implementation RestServiceAsync

- (id)init {
    self = [super init];
    if (self) {
        self.queue = dispatch_queue_create("RestServiceAsync", nil);
    }
    return self;
}

- (void)callURL:(NSString *)uri withParameters:(NSDictionary *)parameters withCallBack:(RESTCallBack)getCallBack {
    RESTCallBack syncCallback = ^(id response) {
        dispatch_async(dispatch_get_main_queue(), ^{
            getCallBack(response);
        });
    };

    dispatch_async(self.queue, ^{
        [super callURL:uri withParameters:parameters withCallBack:syncCallback];
    });
}

- (void)retryRequest:(NSString *)uri parameters:(NSDictionary *)parameters getCallBack:(RESTCallBack)getCallBack {
    dispatch_async(dispatch_get_main_queue(), ^{
        [super retryRequest:uri parameters:parameters getCallBack:getCallBack];
    });
}


@end