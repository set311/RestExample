

#import <Foundation/Foundation.h>

@protocol IRestServiceProtocol <NSObject>

typedef void (^RESTCallBack)(id response);

- (void)__getFromURI:(NSString *)uri withParameters:(NSMutableDictionary *)parameters withCallBack:(RESTCallBack)getCallBack;

- (NSString *)__getSing:(NSString *)uri withParameters:(NSDictionary *)parameters;

- (NSString *)__appendEscapedParameters:(NSDictionary *)dictionary;

- (void)retryRequest:(NSString *)uri parameters:(NSDictionary *)parameters getCallBack:(RESTCallBack)getCallBack;

@end