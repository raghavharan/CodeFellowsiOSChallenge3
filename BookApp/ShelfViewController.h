//
//  LibraryViewController.h
//  BookApp
//
//  Raghav Haran
//  Code Fellows iOS Challenge 3
//

#import <UIKit/UIKit.h>

#import "Library.h"

@interface ShelfViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) Library* mylibrary;

@property (nonatomic, assign) UINavigationItem* navitem;

@property(nonatomic, assign) IBOutlet UITableView*   tableView;

@end
