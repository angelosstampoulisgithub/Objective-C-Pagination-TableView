//
//  ViewController.m
//  ObjectiveCPaginationTableview
//
//  Created by Angelos Staboulis on 5/10/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
unsigned long sum;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self loadData];
}
- (void) setupTableView{
    _numbers = [NSMutableArray array];
    [_tableViewNumbers registerClass:[UITableViewCell self] forCellReuseIdentifier:@"cell"];
    [_tableViewNumbers setDelegate:self];
    [_tableViewNumbers setDataSource:self];
    [[self navigationItem] setTitle:@"Objective-C- PaginationTableView"];
}
- (void)loadData{
    for(int item=0;item<20;item++){
        unsigned long number = ([_numbers count] - 1);
        sum = (number + 1);
        [_numbers insertObject:[NSNumber numberWithLong:sum] atIndex:sum];
    }
    [_tableViewNumbers reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_numbers count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.row <  _numbers.count-1) {
        [cell.textLabel setText:[NSString stringWithFormat:@"%@",[_numbers objectAtIndex:indexPath.row]]];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==  _numbers.count-1) {
        [self loadData];
    }
}
@end
