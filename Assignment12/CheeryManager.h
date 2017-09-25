#import <Foundation/Foundation.h>
#import "Kitchen.h"
#import "DeliveryService.h"
@interface CheeryManager : NSObject <KitchenDelegate>

@property (nonatomic, weak) DeliveryService *deliveryService;
@end

