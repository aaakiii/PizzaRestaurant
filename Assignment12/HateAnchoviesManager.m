#import "HateAnchoviesManager.h"

@implementation HateAnchoviesManager

-(BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings
{
    if([toppings containsObject:@"anchovi"]){
        return NO;
    }
    return YES;
}
-(BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen
{
    return NO;
}

-(void)kitchenDidMakePizza:(Pizza *)pizza
{
    NSLog(@"%@",pizza);
    [self.deliveryService deliverPizza:pizza];
}

@end
