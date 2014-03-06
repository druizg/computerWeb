//
//  STIcomputerModel.m
//  computer
//
//  Created by chuck davila rios on 27/02/14.
//  Copyright (c) 2014 chuck davila rios. All rights reserved.
//

#import "STIcomputerModel.h"

@implementation STIcomputerModel


@synthesize photo = _photo;

#pragma mark - Propiedades
-(UIImage *) photo
{
    //esto va a bloquear, asi que deberia hacerse en segundo plano
    //pero aun no sabemos hacerlo, asi que asi le dejamos mientras
    
    //esto se le llama carga perezosa; solo cargará algo sino se tiene asignado nada
    if (_photo == nil) {
        _photo=[UIImage imageWithData:[NSData dataWithContentsOfURL:self.photoURL]];
    }
    
    return _photo;
}


#pragma mark - classMethods
+(id) computerWithModelComputer:(NSString *) aModelComputer
                 computerCompany:(NSString *) aComputerCompany
                            type:(NSString *) aType
                           notes:(NSString *) aNotes
                           //photo:(UIImage *) aPhoto
                 keyboardLanguages:(NSArray *) aKeyborLangaje
                          inches:(int) anInches
                          rating:(int) aRating
              computerCompanyWeb:(NSURL *) aURL
                       photoURL:(NSURL *)aPhotoURL{
    
    return [[self alloc] initWithModelComputer: aModelComputer
                               computerCompany: aComputerCompany
                                          type: aType
                                         notes: aNotes
                                        //photo: aPhoto
                               keyboardLanguages: aKeyborLangaje
                                        inches: anInches
                                        rating: aRating
                            computerCompanyWeb: aURL
                                      photoURL:aPhotoURL
            ];

}

+(id) computerWithModelComputer:(NSString *)aModelComputer
                 computerCompany:(NSString *)aComputerCompany
                            type:(NSString *)aType
                          inches:(int)anInches{
    
    return [[self alloc]initWithModelComputer:(NSString *)aModelComputer
                              computerCompany:(NSString *)aComputerCompany
                                         type:(NSString *)aType
                                       inches:(int)anInches];
}

#pragma mark - INIT
-(id) initWithModelComputer:(NSString *) aModelComputer
             computerCompany:(NSString *) aComputerCompany
                        type:(NSString *) aType
                       notes:(NSString *) aNotes
                       //photo:(UIImage *) aPhoto
             keyboardLanguages:(NSArray *) aKeyborLangaje
                      inches:(int) anInches
                      rating:(int) aRating
          computerCompanyWeb:(NSURL *) aURL
                   photoURL:(NSURL *) aPhotoURL{
    

    _modelComputer = aModelComputer;
    _computerCompany = aComputerCompany;
    _type = aType;
    _notes = aNotes;
    //_photo = aPhoto;
    _keybordLanguaje = aKeyborLangaje;
    _inches = anInches;
    _rating = aRating;
    _computerCompanyWeb = aURL;
    _photoURL = aPhotoURL;
    
    return self;
}

-(id) initWithModelComputer:(NSString *)aModelComputer
             computerCompany:(NSString *)aComputerCompany
                        type:(NSString *)aType
                      inches:(int)anInches {

    return [self initWithModelComputer:aModelComputer
                        computerCompany:aComputerCompany
                                   type:aType
                                  notes:nil
                                  //photo:nil
                        keyboardLanguages:nil
                                 inches:anInches
                                 rating: NO_RATING
                     computerCompanyWeb:nil
                              photoURL:nil] ;
}

#pragma mark - JSON
-(id) initWithDictionary:(NSDictionary *) aDict
{
    return [self initWithModelComputer:[aDict objectForKey:@"modelComputer"]
                       computerCompany:[aDict objectForKey:@"computerCompany"]
                                  type:[aDict objectForKey:@"type"]
                                 notes:[aDict objectForKey:@"notes"]
                     keyboardLanguages: [self extractLanguagesFromNSString:[aDict objectForKey:@"keyboardLanguaje"]]
                                inches:[[aDict objectForKey:@"inches" ] intValue]
                                rating:[[aDict objectForKey:@"rating"] intValue]
                    computerCompanyWeb:[NSURL URLWithString:[aDict objectForKey:@"computerCompanyWeb"]]
                                 photoURL:[NSURL URLWithString:[aDict objectForKey:@"photoURL"]]
            ];
    
    //keybordLanguaje:[self extractLanguagesFromJSONArray:[aDict objectForKey:@"keyboardLanguaje"]]
}

-(NSDictionary *) proxyForJSON
{
    return @{@"modelComputer": self.modelComputer,
             @"computerCompany": self.computerCompany,
             @"type": self.type,
             @"notes": self.notes,
             @"keyboardLanguaje":self.keybordLanguaje,
             @"inches":@(self.inches),
             @"rating":@(self.rating),
             @"computerCompanyWeb":self.computerCompanyWeb,
             @"photoURL": [self.photoURL path]
            };
}

-(NSString * ) description
{
    return [NSString stringWithFormat:@"modelComputer: %@ computerCompany: %@ type: %@ inches: %d keyboardLanguage: %@ rating: %d notes: %@ photoURL: %@ computerCompanyWeb: %@", self.modelComputer, self.computerCompany, self.type, self.inches, self.keybordLanguaje, self.rating, self.notes, self.photoURL ,self.computerCompanyWeb];
}


#pragma mark - Utils
-(NSArray *) extractLanguagesFromNSString:(NSString *) stringLanguages
{
    NSArray *arrayLanguages = [stringLanguages componentsSeparatedByString:@","];
    
    return arrayLanguages;
}

-(NSArray *) extractLanguagesFromJSONArray:(NSArray *) JSONArray
{
    NSMutableArray *languages = [NSMutableArray arrayWithCapacity:[JSONArray count]];
    
    for(NSDictionary *dict in JSONArray){
        [languages addObject:[dict objectForKey:@"keyboardLanguaje"]];
    }
    
    return languages;
}

-(NSArray *) packLanguajesIntoJSONArray
{
    NSMutableArray *JSONArray = [NSMutableArray arrayWithCapacity:[self.keybordLanguaje count]];
    
    for(NSString *language in self.keybordLanguaje){
        [JSONArray addObject:@{@"keyboardLanguaje": language}];
    }
    
    return JSONArray;
}


@end
