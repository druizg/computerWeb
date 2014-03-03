//
//  STIcomputerModel.m
//  computer
//
//  Created by chuck davila rios on 27/02/14.
//  Copyright (c) 2014 chuck davila rios. All rights reserved.
//

#import "STIcomputerModel.h"

@implementation STIcomputerModel


#pragma mark - classMethods
+(id) computerWithModelComputer:(NSString *) aModelComputer
                 computerCompany:(NSString *) aComputerCompany
                            type:(NSString *) aType
                           notes:(NSString *) aNotes
                           photo:(UIImage *) aPhoto
                 keybordLanguaje:(NSArray *) aKeyborLangaje
                          inches:(int) anInches
                          rating:(int) aRating
              computerCompanyWeb:(NSURL *) aURL{
    
    return [[self alloc] initWithModelComputer: aModelComputer
                       computerCompany: aComputerCompany
                                  type: aType
                                 notes: aNotes
                                 photo: aPhoto
                       keybordLanguaje: aKeyborLangaje
                                inches: anInches
                                rating: aRating
                    computerCompanyWeb: aURL];

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
                       photo:(UIImage *) aPhoto
             keybordLanguaje:(NSArray *) aKeyborLangaje
                      inches:(int) anInches
                      rating:(int) aRating
          computerCompanyWeb:(NSURL *) aURL {
    

    _modelComputer = aModelComputer;
    _computerCompany = aComputerCompany;
    _type = aType;
    _notes = aNotes;
    _photo = aPhoto;
    _keybordLanguaje = aKeyborLangaje;
    _inches = anInches;
    _rating = aRating;
    _computerCompanyWeb = aURL;
    
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
                                  photo:nil
                        keybordLanguaje:nil
                                 inches:anInches
                                 rating: NO_RATING
                     computerCompanyWeb:nil ] ;
}

@end
