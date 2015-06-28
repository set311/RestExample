#import <Foundation/Foundation.h>

@protocol IRestServiceProtocol <NSObject>

typedef void (^RESTCallBack)(id response);

- (void)callURL:(NSString *)uri
 withParameters:(NSDictionary *)parameters
   withCallBack:(RESTCallBack)getCallBack;

@end