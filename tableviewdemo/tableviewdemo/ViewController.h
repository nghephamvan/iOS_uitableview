//
//  ViewController.h
//  tableviewdemo
//
//  Created by TMA103 on 4/14/17.
//  Copyright © 2017 TMA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray *imageArray;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)btnEditTapped:(UIBarButtonItem *)sender;
- (IBAction)btnRefreshTapped:(UIBarButtonItem *)sender;
@end

