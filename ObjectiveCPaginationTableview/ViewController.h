//
//  ViewController.h
//  ObjectiveCPaginationTableview
//
//  Created by Angelos Staboulis on 5/10/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableViewNumbers;
@property NSMutableArray<NSNumber*> *numbers;
-(void) loadData;
-(void) setupTableView;
@end

