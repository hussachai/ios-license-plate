//
//  StateTableDataSource.h
//  LicensePlateGame2
//
//  Created by Hussachai Puripunpinyo on 10/12/13.
//  Copyright (c) 2013 Hussachai Puripunpinyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "State.h"

@interface StateTableDataSource : NSObject <UITableViewDataSource>

@property (strong, nonatomic) NSArray *states;

- (int) getNumberOfSections;

- (int) getNumberOfRows: (int) section;

- (State*) getItemAtSection: (int) section row: (int) row;

- (void) reset;

@end
