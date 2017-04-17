//
//  ViewController.m
//  tableviewdemo
//
//  Created by TMA103 on 4/14/17.
//  Copyright © 2017 TMA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray *imageArray;
}
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self arraySetup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) arraySetup {
    imageArray = [NSMutableArray arrayWithArray:@[@"1.jpg", @"2.jpg", @"3.jpg", @"4.jpg"]];
}

#pragma mark - UITableView DataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return imageArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    cell.imageView.image = [UIImage imageNamed:imageArray[indexPath.row]];
    cell.textLabel.text = imageArray[indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", (int)indexPath.row +1];
    
    cell.contentView.layer.cornerRadius = 8;
    cell.contentView.layer.borderWidth = 0.5;
    cell.contentView.layer.borderColor = [UIColor blackColor].CGColor;
    return cell	;
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [imageArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
}

- (IBAction)btnEditTapped:(id)sender {
    [[self tableview] setEditing:NO animated:YES];
    [super setEditing:NO animated:YES];
    
    [[self tableview] setNeedsDisplay];
    [[self tableview] reloadData];
    // self.tableview.editing = !self.tableview.editing;
}

- (IBAction)btnRefreshTapped:(id)sender {
    [self.tableview reloadData];
}

@end
