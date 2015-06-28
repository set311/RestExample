#import <Foundation/Foundation.h>
#import "IRestServiceProtocol.h"
#import "IMessageRepresentationHandler.h"

@protocol IMessageRepresentationHandler;

@interface RestService : NSObject <IRestServiceProtocol>

@property(nonatomic, strong) id <IMessageRepresentationHandler> messageRepresentationHandler;
@property(nonatomic, strong) NSString *apiUrl;

- (void)retryRequest:(NSString *)uri parameters:(NSDictionary *)parameters getCallBack:(RESTCallBack)getCallBack;
@end