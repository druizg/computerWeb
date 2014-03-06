//
//  STIComputerStoreModel.m
//  computer
//
//  Created by chuck davila rios on 01/03/14.
//  Copyright (c) 2014 chuck davila rios. All rights reserved.
//

#import "STIComputerStoreModel.h"

@interface STIComputerStoreModel()

@property (strong, nonatomic) NSMutableArray * desktpComputers;
@property (strong, nonatomic) NSMutableArray * laptopComputers;
@property (strong, nonatomic) NSMutableArray * otherComputers;

@end



@implementation STIComputerStoreModel

-(id) init
{
    if(self = [super init]){
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.1.48/arcgis/rest/services/computerStore/MapServer/0/query?where=1%3D1&outFields=*&returnGeometry=false&f=json"]];
        NSURLResponse *response = [[NSURLResponse alloc] init];
        NSError *error= nil;
        
        NSData *data = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:&response
                                                         error:&error];
        
        if (data != nil) {
            //no ha habido error
            NSDictionary *allJSONObjects =  [NSJSONSerialization JSONObjectWithData:data
                                                                            options: kNilOptions
                                                                              error:&error];
            
            if (allJSONObjects != nil) {
                NSArray *featuresArray = [allJSONObjects objectForKey:@"features"];
                if (featuresArray != nil) {
                    for(NSDictionary *feature in featuresArray){
                        NSDictionary *attribs = [feature objectForKey:@"attributes"];
                        
                        STIcomputerModel *computer = [[STIcomputerModel alloc] initWithDictionary:attribs];
                        
                        //añadimos al array del tipo Adecuado
                        if ([[computer.type lowercaseString] isEqualToString: DESKTOP_COMPUTER_KEY]) {
                            if (!self.desktpComputers) {
                                self.desktpComputers = [NSMutableArray arrayWithObject:computer];
                            }else{
                                [self.desktpComputers addObject:computer];
                            }
                        }else if ([[computer.type lowercaseString] isEqualToString:LAPTOP_COMPUTER_KEY]){
                            if (!self.laptopComputers) {
                                self.laptopComputers = [NSMutableArray arrayWithObject:computer];
                            }else{
                                [self.laptopComputers addObject:computer];
                            }
                        }else{
                            if (!self.otherComputers) {
                                self.otherComputers = [NSMutableArray arrayWithObject:computer];
                            }else{
                                [self.otherComputers addObject:computer];
                            }
                        }
                    }
                }else{
                    NSLog(@"No se pudo obtener el array Features");
                }
            }else {
                NSLog(@"Error al parsear JSON %@", error.localizedDescription);
            }
        }else {
            NSLog(@"Error al obtener datos del servidor %@", error.localizedDescription);
        }
    }
    
    return self;
}


#pragma mark - Properties
-(int) desktopComputerCount
{
    return [self.desktpComputers count];
}
-(int) laptopComputerCount
{
    return [self.laptopComputers count];
}
-(int) otherComputerCount
{
    return [self.otherComputers count];
}


-(STIcomputerModel *) desktopComputerAtIndex: (int) index
{
    return [self.desktpComputers objectAtIndex:index];
}


-(STIcomputerModel *) laptopComputerAtIndex: (int) index
{
    return [self.laptopComputers objectAtIndex:index];
}


-(STIcomputerModel *) otherComputerAtIndex: (int) index
{
    return [self.otherComputers objectAtIndex:index];
}



@end
