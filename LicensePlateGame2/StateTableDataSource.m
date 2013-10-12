//
//  StateTableDataSource.m
//  LicensePlateGame2
//
//  Created by Hussachai Puripunpinyo on 10/12/13.
//  Copyright (c) 2013 Hussachai Puripunpinyo. All rights reserved.
//

#import "StateTableDataSource.h"

@interface StateTableDataSource()

@property (strong, nonatomic) NSArray *groups;

@end

@implementation StateTableDataSource

- (id) init{
    self = [super init];
    self.groups = [[NSArray alloc] initWithObjects:@"A", @"C", @"D", @"F",
                   @"G", @"H", @"I", @"K", @"L", @"M", @"N", @"O", @"P" @"R", @"S",
                   @"T", @"U", @"V", @"W", nil];
    NSMutableArray *states = [[NSMutableArray alloc] initWithCapacity:18];
    states[0] = [[NSArray alloc] initWithObjects:
                 [self createState: @"Alabama" nickname: @"Yellowhammer State"
                   licensePlateUrl: @"http://www.15q.net/us1/al09a.jpg"],
                 [self createState: @"Alaska" nickname: @"The Last Frontier"
                   licensePlateUrl: @"http://www.15q.net/us1/ak12.jpg"],
                 [self createState: @"Arizona" nickname: @"The Grand Canyon State"
                   licensePlateUrl: @"http://www.15q.net/us1/az09b.jpg"],
                 [self createState: @"Arkansas" nickname: @"The Natural State"
                   licensePlateUrl: @"http://www.15q.net/us1/ar07.jpg"],
                 nil];
    states[1] = [[NSArray alloc] initWithObjects:
                 [self createState: @"California" nickname: @"The Golden State"
                   licensePlateUrl: @"http://www.15q.net/us1/ca12.jpg"],
                 [self createState: @"Colorado" nickname: @"The Centennial State"
                   licensePlateUrl: @"http://www.15q.net/us1/co01.jpg"],
                 [self createState: @"Connecticut" nickname: @"The Constitution State"
                   licensePlateUrl: @"http://www.15q.net/us1/ct02.jpg"],
                 nil];
    states[2] = [[NSArray alloc] initWithObjects:
                 [self createState: @"Delaware" nickname: @"The First State"
                   licensePlateUrl: @"http://www.15q.net/us1/de08.jpg"],
                 [self createState: @"District of Columbia" nickname: @"The Federal City"
                   licensePlateUrl: @"http://www.15q.net/us1/dc03.jpg"],
                 nil];
    states[3] = [[NSArray alloc] initWithObjects:
                 [self createState: @"Florida" nickname: @"The Sunshine State"
                   licensePlateUrl: @"http://www.15q.net/us1/fl10.jpg"],
                 nil];
    states[4] = [[NSArray alloc] initWithObjects:
                 [self createState: @"Georgia" nickname: @"The Peach State"
                   licensePlateUrl: @"http://www.15q.net/us1/ga13.jpg"],
                 nil];
    states[5] = [[NSArray alloc] initWithObjects:
                 [self createState: @"Hawaii" nickname: @"The Aloha State"
                   licensePlateUrl: @"http://www.15q.net/us2/hi94.jpg"],
                 nil];
    states[6] = [[NSArray alloc] initWithObjects:
                 [self createState: @"Idaho" nickname: @"The Gem State"
                   licensePlateUrl: @"http://www.15q.net/us2/id09.jpg"],
                 [self createState: @"Illinois" nickname: @"Prairie State"
                   licensePlateUrl: @"http://www.15q.net/us2/il02a.jpg"],
                 [self createState: @"Indiana" nickname: @"The Hoosier State"
                   licensePlateUrl: @"http://www.15q.net/us2/in14.jpg"],
                 [self createState: @"Iowa" nickname: @"The Hawkeye State"
                   licensePlateUrl: @"http://www.15q.net/us2/ia12.jpg"],
                 nil];
    states[7] = [[NSArray alloc] initWithObjects:
                 [self createState: @"Kansas" nickname: @"The Sunflower State"
                   licensePlateUrl: @"http://www.15q.net/us2/ks08.jpg"],
                 [self createState: @"Kentucky" nickname: @"The Bluegrass State"
                   licensePlateUrl: @"http://www.15q.net/us2/ky08.jpg"],
                 nil];
    states[8] = [[NSArray alloc] initWithObjects:
                 [self createState: @"Louisiana" nickname: @"The Pelican State"
                   licensePlateUrl: @"http://www.15q.net/us2/la13a.jpg"],
                 nil];
    states[9] = [[NSArray alloc] initWithObjects:
                 [self createState: @"Maine" nickname: @"The Pine Tree State"
                   licensePlateUrl: @"http://www.15q.net/us2/me00a.jpg"],
                 [self createState: @"Maryland" nickname: @"The Old Line State"
                   licensePlateUrl: @"http://www.15q.net/us2/md12.jpg"],
                 [self createState: @"Massachusetts" nickname: @"The Bay State"
                   licensePlateUrl: @"http://www.15q.net/us3/ma03a.jpg"],
                 [self createState: @"Michigan" nickname: @"The Great Lakes State"
                   licensePlateUrl: @"http://www.15q.net/us3/mi07a.jpg"],
                 [self createState: @"Minnesota" nickname: @"The North Star State"
                   licensePlateUrl: @"http://www.15q.net/us3/mn10b.jpg"],
                 [self createState: @"Missisippi" nickname: @"The Magnolia State"
                   licensePlateUrl: @"http://www.15q.net/us3/ms13.jpg"],
                 [self createState: @"Missouri" nickname: @"The Show Me State"
                   licensePlateUrl: @"http://www.15q.net/us3/mo10.jpg"],
                 [self createState: @"Montana" nickname: @"The Treasure State"
                   licensePlateUrl: @"http://www.15q.net/us3/mt11.jpg"],
                 nil];
    states[10] = [[NSArray alloc] initWithObjects:
                  [self createState: @"Nebraska" nickname: @"The Cornhusker State"
                    licensePlateUrl: @"http://www.15q.net/us3/ne12.jpg"],
                  [self createState: @"Nevada" nickname: @"The Silver State"
                    licensePlateUrl: @"http://www.15q.net/us3/nv07.jpg"],
                  [self createState: @"New Hampshire" nickname: @"The Granite State"
                    licensePlateUrl: @"http://www.15q.net/us3/nh01.jpg"],
                  [self createState: @"New Jersey" nickname: @"The Garden State"
                    licensePlateUrl: @"http://www.15q.net/us3/nj08.jpg"],
                  [self createState: @"New Mexico" nickname: @"The Land of Enchantment"
                    licensePlateUrl: @"http://www.15q.net/us4/nm00a.jpg"],
                  [self createState: @"New York" nickname: @"The Empire State"
                    licensePlateUrl: @"http://www.15q.net/us4/ny10.jpg"],
                  [self createState: @"North Carolina" nickname: @"The Tar Heel State"
                    licensePlateUrl: @"http://www.15q.net/us4/nc10.jpg"],
                  [self createState: @"North Dakota" nickname: @"The Peace Garden State"
                    licensePlateUrl: @"http://www.15q.net/us4/nd93.jpg"],
                  nil];
    states[11] = [[NSArray alloc] initWithObjects:
                  [self createState: @"Ohio" nickname: @"The Buckeye State"
                    licensePlateUrl: @"http://www.15q.net/us4/oh13.jpg"],
                  [self createState: @"Oklahoma" nickname: @"The Sooner State"
                    licensePlateUrl: @"http://www.15q.net/us4/ok10.jpg"],
                  [self createState: @"Oregon" nickname: @"The Beaver State"
                    licensePlateUrl: @"http://www.15q.net/us4/or08.jpg"],
                  nil];
    states[12] = [[NSArray alloc] initWithObjects:
                  [self createState: @"Pennsylvania" nickname: @"The Keystone State"
                    licensePlateUrl: @"http://www.15q.net/us4/pa06.jpg"],
                  [self createState: @"Rhode Island" nickname: @"The Ocean State"
                    licensePlateUrl: @"http://www.15q.net/us4/ri97.jpg"],
                  nil];
    states[13] = [[NSArray alloc] initWithObjects:
                  [self createState: @"South Carolina" nickname: @"The Palmetto State"
                    licensePlateUrl: @"http://www.15q.net/us4/sc09.jpg"],
                  [self createState: @"South Dakota" nickname: @"Mount Rushmore State"
                    licensePlateUrl: @"http://www.15q.net/us5/sd07.jpg"],
                  nil];
    states[14] = [[NSArray alloc] initWithObjects:
                  [self createState: @"Tennessee" nickname: @"The Volunteer State"
                    licensePlateUrl: @"http://www.15q.net/us5/tn12.jpg"],
                  [self createState: @"Texas" nickname: @"The Lone Star State"
                    licensePlateUrl: @"http://www.15q.net/us5/tx13.jpg"],
                  nil];
    states[15] = [[NSArray alloc] initWithObjects:
                  [self createState: @"Utah" nickname: @"The Beehive State"
                    licensePlateUrl: @"http://www.15q.net/us5/ut08.jpg"],
                  nil];
    states[16] = [[NSArray alloc] initWithObjects:
                  [self createState: @"Vermont" nickname: @"The Green Mountain State"
                    licensePlateUrl: @"http://www.15q.net/us5/vt91.jpg"],
                  [self createState: @"Virginia" nickname: @"The Old Dominion State"
                    licensePlateUrl: @"http://www.15q.net/us5/va09.jpg"],
                  nil];
    states[17] = [[NSArray alloc] initWithObjects:
                  [self createState: @"Washington" nickname: @"The Evergreen State"
                    licensePlateUrl: @"http://www.15q.net/us5/wa11.jpg"],
                  [self createState: @"West Virginia" nickname: @"The Mountain State"
                    licensePlateUrl: @"http://www.15q.net/us5/wv07.jpg"],
                  [self createState: @"Wisconsin" nickname: @"The Badger State"
                    licensePlateUrl: @"http://www.15q.net/us5/wi01.jpg"],
                  [self createState: @"Wyoming" nickname: @"The Equality or Cowboy State"
                    licensePlateUrl: @"http://www.15q.net/us5/wy10.jpg"],
                  nil];
    self.states = [states copy];
    if(self.groups.count == self.states.count){
        NSLog(@"Total group of the first alphabet of states: %i", self.groups.count);
    }
    return self;
}

- (State*) createState: (NSString*) name nickname: (NSString*) nickname
       licensePlateUrl: (NSString*) url {
    State *state = [[State alloc] init];
    state.name = name;
    state.nickname = nickname;
    state.backgroundColor = [UIColor whiteColor];
    state.licensePlatUrl = url;
    return state;
}

- (int) getNumberOfSections {
    return self.groups.count;
}

- (int) getNumberOfRows: (int) section {
    //    return [self.states objectAtIndex: section];
    return [self.states[section] count];
}

- (State*) getItemAtSection: (int) section row: (int) row {
    return self.states[section][row];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [self getNumberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // Return the number of rows in the section.
    return [self getNumberOfRows: section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"stateCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    State *state = [self getItemAtSection: indexPath.section row: indexPath.row];
    cell.textLabel.text = state.name;
    cell.detailTextLabel.text = state.nickname;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.groups[section];
}

//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
//    return self.groups;
//}

- (void) reset {
    for(int section = 0; section < [self getNumberOfSections]; section++){
        for(int row = 0; row < [self getNumberOfRows: section]; row++){
            State *state = [self getItemAtSection:section row:row];
            state.backgroundColor = [UIColor whiteColor];
            state.clicked = NO;
        }
    }
}

@end
