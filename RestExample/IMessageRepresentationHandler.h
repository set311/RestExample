

#import <Foundation/Foundation.h>


@protocol IMessageRepresentationHandler <NSObject>

- (void)showRetryTransferAlertViewWithBlock:(void (^)(void))callbackBlock;

@end