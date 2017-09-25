#import "CheeryManager.h"

@implementation CheeryManager


-(BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings
{
    return YES;
}
-(BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen
{
    return YES;
}

-(void)kitchenDidMakePizza:(Pizza *)pizza
{
    NSLog(@"Hehehe!! Here is %@", pizza);
    [self.deliveryService deliverPizza:pizza];
}


@end
