//
//  STIcomputerModel.h
//  computer
//
//  Created by chuck davila rios on 27/02/14.
//  Copyright (c) 2014 chuck davila rios. All rights reserved.
//

#import <Foundation/Foundation.h>
#define NO_RATING 0

@interface STIcomputerModel : NSObject

#pragma mark - PROPERTIES
    @property (strong, nonatomic) NSString *modelComputer;
    @property (strong, nonatomic) NSString *computerCompany;
    @property (strong, nonatomic) NSString *type;
    @property (strong, nonatomic) NSString *notes;
    @property (strong, nonatomic) UIImage *photo;

    @property (strong, nonatomic) NSArray *keybordLanguaje;

    @property (nonatomic) int inches;
    @property (nonatomic) int rating;

    @property (strong, nonatomic) NSURL *computerCompanyWeb;


//METODOS DE CLASE
#pragma mark - classMethods
+(id) computerWithModelComputer:(NSString *) aModelComputer
                 computerCompany:(NSString *) aComputerCompany
                            type:(NSString *) aType
                           notes:(NSString *) aNotes
                           photo:(UIImage *) aPhoto
                 keybordLanguaje:(NSArray *) aKeyborLangaje
                          inches:(int) anInches
                          rating:(int) aRating
              computerCompanyWeb:(NSURL *) aURL;

+(id) computerWithModelComputer:(NSString *)aModelComputer
                 computerCompany:(NSString *)aComputerCompany
                            type:(NSString *)aType
                          inches:(int)anInches;


#pragma mark - INIT
-(id) initWithModelComputer:(NSString *) aModelComputer
             computerCompany:(NSString *) aComputerCompany
                        type:(NSString *) aType
                       notes:(NSString *) aNotes
                       photo:(UIImage *) aPhoto
             keybordLanguaje:(NSArray *) aKeyborLangaje
                      inches:(int) anInches
                      rating:(int) aRating
          computerCompanyWeb:(NSURL *) aURL;

-(id) initWithModelComputer:(NSString *) aModelComputer
             computerCompany:(NSString *) aComputerCompany
                        type:(NSString *) aType
                      inches:(int) anInches;
@end
