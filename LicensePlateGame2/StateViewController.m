//
//  ViewController.m
//  LicensePlateGame2
//
//  Created by Hussachai Puripunpinyo on 10/12/13.
//  Copyright (c) 2013 Hussachai Puripunpinyo. All rights reserved.
//

#import "StateViewController.h"
#import "StateTableDataSource.h"
#import "LicensePlateViewController.h"

@interface StateViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *scoreBarBtn;
@property (weak, nonatomic) IBOutlet UITableView *stateTableView;
@property (strong, nonatomic) StateTableDataSource *dataSource;
@property (nonatomic) int score;

@end

@implementation StateViewController{
    UIColor *lightGreen;
    UITableViewCell *selectedCell;
    State *selectedState;
    AVAudioPlayer *startSound;
    AVAudioPlayer *selectedSound;
    AVAudioPlayer *unselectedSound;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.dataSource = [[StateTableDataSource alloc] init];
    self.stateTableView.delegate = self;
    self.stateTableView.dataSource = self.dataSource;
    self.score = 0;
    lightGreen = [UIColor colorWithRed:0.75 green:0.97 blue:0.75 alpha:1];
    [self setupSFXs];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupSFXs{
    NSError *err;
    // Set up the URL of the sound file.
    NSURL *url = [[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"start" ofType:@"mp3"]];
    // Create the player, and initialize it with the sound file.
    startSound = [[AVAudioPlayer alloc] initWithContentsOfURL:(url) error:&err];
    [startSound prepareToPlay];
    
    url = [[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"selected" ofType:@"mp3"]];
    selectedSound = [[AVAudioPlayer alloc] initWithContentsOfURL:(url) error:&err];
    [selectedSound prepareToPlay];
    
    url = [[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"unselected" ofType:@"mp3"]];
    unselectedSound = [[AVAudioPlayer alloc] initWithContentsOfURL:(url) error:&err];
    [unselectedSound prepareToPlay];
    
    [startSound play];
}

- (IBAction)resetGameClicked:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Please Verify" message:@"Do want to reset the game?" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
    alertView.tag = 10;
    [alertView show];
}

- (void) alertView: (UIAlertView*) alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(alertView.tag == 10){
        if(buttonIndex == 0){
            NSLog(@"Game is reset");
            self.score = 0;
            [self.dataSource reset];
//            for (NSInteger section = 0;
//                 section < [self.stateTableView numberOfSections]; section++){
//                for (NSInteger row = 0;
//                     row < [self.stateTableView numberOfRowsInSection: row]; row++){
//                    UITableViewCell *cell = [self.stateTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
//                    cell.backgroundColor = [UIColor whiteColor];
//                }
//            }
            //This way of reset is much more elegant
            [self.stateTableView reloadRowsAtIndexPaths:
                [self.stateTableView indexPathsForVisibleRows]
                withRowAnimation:UITableViewRowAnimationNone];
            
            [self updateGameState];
            [startSound play];
        }
    }else if(alertView.tag == 11){
        if(buttonIndex == 0){
            [self updateGameState];
        }
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    LicensePlateViewController *detailViewController = [segue destinationViewController];
    if(![sender isMemberOfClass:[UITableViewCell class]]){
        return;
    }
    UITableViewCell *cell = (UITableViewCell*)sender;
    NSIndexPath *indexPath = [self.stateTableView indexPathForCell: cell];
    State *state = [self.dataSource getItemAtSection:indexPath.section row:indexPath.row];
    detailViewController.stateName = state.name;
    detailViewController.licensePlateUrl = state.licensePlatUrl;
    
//    if ([[segue identifier] isEqualToString:@"ShowDetails"]) {
//        MyDetailViewController *detailViewController = [segue destinationViewController];
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        detailViewController.data = [self.dataController objectInListAtIndex:indexPath.row];
//    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    State *state = [self.dataSource getItemAtSection:indexPath.section row:indexPath.row];
    selectedState = state;
    selectedCell = cell;
    if(state.clicked){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Please Verify" message: [NSString stringWithFormat: @"Do you want to reset %@ ?", state.name]
            delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
        alertView.tag = 11;
        [alertView show];
    }else{
        [self updateGameState];
    }
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    State *state = [self.dataSource getItemAtSection:indexPath.section row:indexPath.row];
    cell.backgroundColor = state.backgroundColor;
}

- (void) updateGameState {
    if(selectedCell && selectedState){
        if(selectedState.clicked){
            self.score--;
            selectedCell.backgroundColor = [UIColor whiteColor];
            selectedState.backgroundColor = [UIColor whiteColor];
            selectedState.clicked = NO;
            [unselectedSound play];
        }else{
            self.score++;
            selectedCell.backgroundColor = lightGreen;
            selectedState.backgroundColor = lightGreen;
            selectedState.clicked = YES;
            [selectedSound play];
        }
        selectedCell = nil;
        selectedState = nil;
    }
    self.scoreBarBtn.title = [NSString stringWithFormat:@"Score: %i/50", self.score];
}

@end
