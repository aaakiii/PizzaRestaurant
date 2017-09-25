#import "DeliveryService.h"

@implementation DeliveryService

- (instancetype)init
{
    self = [super init];
    if (self) {
        _pizzas = [NSMutableArray new];
    }
    return self;
}

-(void) deliverPizza:(Pizza *)pizza
{
    [_pizzas addObject:pizza];
}
@end
