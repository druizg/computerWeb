//
//  STIComputerStoreModel.m
//  computer
//
//  Created by chuck davila rios on 01/03/14.
//  Copyright (c) 2014 chuck davila rios. All rights reserved.
//

#import "STIComputerStoreModel.h"

@interface STIComputerStoreModel()

@property (strong, nonatomic) NSArray * desktpComputers;
@property (strong, nonatomic) NSArray * laptopComputers;
@property (strong, nonatomic) NSArray * otherComputers;

@end



@implementation STIComputerStoreModel

-(id) init
{
    if(self = [super init]){
        STIcomputerModel * probook = [STIcomputerModel
                                      computerWithModelComputer: @"ProBook"
                                      computerCompany: @"HP"
                                      type:@"Desktop"
                                      notes:@"Esta computadora esta equipada con un gran monitor de resolucion intermedia incluye teclado numérico. Entre sus caracteristicas internas cuenta con 4GB de RAM (de origen) un procesador Intel Core 2 Duo de 64bits. Los discos duros para este tipo de equipos son con capacidades de almacenamiento  superiores a los 400 GB. Circuitos internos de alta resistencia capaces de soportar varios dias de arduo trabajo sin descanzo. Ademas de que la bateria con la que cuenta tiene una duracion de una semana si la computadora esta encendida pero sin consumir recursos y duracion de 4 dias si el equipo esta siendo usado al 100% de su capacidad. IDEAL PARA EL TRABAJO RUDO."
                                      photo:[UIImage imageNamed:@"desktop-computer.jpg"]
                                      keybordLanguaje: @[@"Latinoamericano"]
                                      inches:17
                                      rating:3
                                      computerCompanyWeb:[NSURL URLWithString:@"http://www.hp.com"]];
        
        STIcomputerModel * satellite = [STIcomputerModel
                                        computerWithModelComputer: @"Satellite"
                                        computerCompany: @"TOSHIBA"
                                        type:@"Laptop"
                                        notes:@"Esta computadora esta equipada con un gran monitor de resolucion intermedia incluye teclado numérico. Entre sus caracteristicas internas cuenta con 4GB de RAM (de origen) un procesador Intel Core 2 Duo de 64bits. Los discos duros para este tipo de equipos son con capacidades de almacenamiento  superiores a los 400 GB. Circuitos internos de alta resistencia capaces de soportar varios dias de arduo trabajo sin descanzo. Ademas de que la bateria con la que cuenta tiene una duracion de una semana si la computadora esta encendida pero sin consumir recursos y duracion de 4 dias si el equipo esta siendo usado al 100% de su capacidad. IDEAL PARA EL TRABAJO RUDO."
                                        photo:[UIImage imageNamed:@"laptop-computer.jpg"]                                        keybordLanguaje: @[@"Latinoamerica", @"Inglés", @"chino"]
                                        inches:15
                                        rating:2
                                        computerCompanyWeb:[NSURL URLWithString:@"http://www.toshiba.com"]];
        
        STIcomputerModel * vostro = [STIcomputerModel
                                     computerWithModelComputer: @"VOSTRO"
                                     computerCompany: @"DELL"
                                     type:@"Laptop"
                                     notes:@"Esta computadora esta equipada con un gran monitor de resolucion intermedia incluye teclado numérico. Entre sus caracteristicas internas cuenta con 4GB de RAM (de origen) un procesador Intel Core 2 Duo de 64bits. Los discos duros para este tipo de equipos son con capacidades de almacenamiento  superiores a los 400 GB. Circuitos internos de alta resistencia capaces de soportar varios dias de arduo trabajo sin descanzo. Ademas de que la bateria con la que cuenta tiene una duracion de una semana si la computadora esta encendida pero sin consumir recursos y duracion de 4 dias si el equipo esta siendo usado al 100% de su capacidad. IDEAL PARA EL TRABAJO RUDO."
                                     photo:[UIImage imageNamed:@"other-computer.jpg"]
                                     keybordLanguaje: @[@"Español", @"Inglés", @"Portugués"]
                                     inches:17
                                     rating:5
                                     computerCompanyWeb:[NSURL URLWithString:@"http://www.dell.com"]];
        
        self.desktpComputers = @[probook];
        self.laptopComputers = @[vostro];
        self.otherComputers  = @[satellite];
    
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
