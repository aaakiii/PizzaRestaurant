#import <Foundation/Foundation.h>
#import "DeliveryCar.h"
#import "Pizza.h"

@interface DeliveryService : NSObject

@property (weak) DeliveryCar *car;
@property NSMutableArray *pizzas;

-(void)deliverPizza:(Pizza *)pizza;

@end
