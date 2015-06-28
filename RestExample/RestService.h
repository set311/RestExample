

#import <Foundation/Foundation.h>
#import "IRestServiceProtocol.h"
#import "IMessageRepresentationHandler.h"

@protocol IMessageRepresentationHandler;
@protocol ICheckPointHandler;
@protocol ICountryCodeProvider;

@interface RestService : NSObject <IRestServiceProtocol>

@property(nonatomic, strong) id <ICountryCodeProvider> cellPhoneCountryProvider;
@property(nonatomic, strong) id <IMessageRepresentationHandler> messageRepresentationHandler;

@property(nonatomic, strong) id signUserInfo;
@property(nonatomic, strong) NSString                           *port;
@property(nonatomic, strong) NSString                           *apiUrl;
@property(nonatomic, copy) NSString *baseCountry;
@end