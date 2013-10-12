//
//  State.h
//  LicensePlateGame2
//
//  Created by Hussachai Puripunpinyo on 10/12/13.
//  Copyright (c) 2013 Hussachai Puripunpinyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface State : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *nickname;
@property (strong, nonatomic) NSString *licensePlatUrl;
@property (strong, nonatomic) UIColor *backgroundColor;
@property (nonatomic) BOOL clicked;

@end
