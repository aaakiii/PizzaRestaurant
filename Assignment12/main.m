#import <Foundation/Foundation.h>
#import "Kitchen.h"
#import "Pizza.h"
#import "HateAnchoviesManager.h"
#import "CheeryManager.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Kitchen *restaurantKitchen = [Kitchen new];
        HateAnchoviesManager *hateAnchovies = [HateAnchoviesManager new];
        CheeryManager *cheery = [CheeryManager new];
        DeliveryService *deliveryService = [DeliveryService new];
        hateAnchovies.deliveryService = deliveryService;
        cheery.deliveryService = deliveryService;
        DeliveryCar *deliveryCar = [DeliveryCar new];
        deliveryService.car = deliveryCar;
        NSLog(@"=== Welcome to Pizza Restaurant ===");
        
        while (TRUE) {
            NSLog(@"Please pick your pizza size and toppings(tomato, sauce, mozzeralla, cheese, pepperonni, anchovi):");
            NSLog(@"> ");
            char str[100];
            fgets (str, 100, stdin);
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            NSLog(@"Input was %@", inputString);
            
            NSArray *commandWords = [inputString componentsSeparatedByString:@" "];
            NSString *keyword = commandWords[0];
            
            Pizza *pizza;
            PizzaSize size;
            NSArray *toppings;
            if ([keyword isEqualToString:@"pepperoni"]) {
                pizza = [Pizza largePepperoni];
            }else {
                
                size = [Pizza sizeFromString:keyword];
                toppings = [commandWords subarrayWithRange:NSMakeRange(1, commandWords.count - 1)];
                
                NSLog(@"Please choose Manager\n 1.HateAnchoviesManager\n 2.CheeryManager");
                char input[5];
                fgets(input, 5, stdin);
                NSString *inputNumber = [[NSString alloc] initWithUTF8String:input];
                inputNumber = [inputNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                
                if([inputNumber isEqualToString:@"1"]){
                    restaurantKitchen.delegate = hateAnchovies;
                }else if([inputNumber isEqualToString:@"2"]){
                    restaurantKitchen.delegate = cheery;
                }
                pizza = [restaurantKitchen makePizzaWithSize:size toppings:toppings];
                
                NSLog(@"We gonna deliver %lu pizza(s):", (unsigned long)deliveryService.pizzas.count);
                for (Pizza *pizza in deliveryService.pizzas) {
                    NSLog(@"- %@", pizza);
                    [deliveryCar deliverPizza:pizza];
                }
                
                if(pizza == NULL){
                    NSLog(@"OH NO, NO PIZZA!!!");
                }
            }
        }
    }
    return 0;
}
