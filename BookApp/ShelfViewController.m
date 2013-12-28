//
//  LibraryViewController.m
//  BookApp
//
//  Raghav Haran
//  Code Fellows iOS Challenge 3
//

#import "ShelfViewController.h"
#import "BookViewController.h"

@interface ShelfViewController ()

@end

@implementation ShelfViewController

@synthesize mylibrary;
@synthesize navitem;
@synthesize tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    // Do any additional setup after loading the view, typically from a nib.
    mylibrary.shelfArray = [[NSMutableArray alloc] init];
    for(int i = 0; i < 10 ;i++)
    {
        Shelf* pShelf = [[Shelf alloc] init];
        pShelf.shelfName = [NSString stringWithFormat:@"%@ -> Shelf-%d", mylibrary.libraryName, i + 1];
        [mylibrary.shelfArray addObject:pShelf];
    }
    
    
}

- (void) viewDidUnload
{
    
    [super viewDidUnload];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [mylibrary.shelfArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier1 = @"ShelfTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier1];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier1];
    }
    
    Shelf* pShelf = [mylibrary.shelfArray objectAtIndex:indexPath.row];
    cell.textLabel.text = pShelf.shelfName;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showBookTable"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BookViewController *destViewController = (BookViewController *)segue.destinationViewController;
        destViewController.mylibrary = mylibrary;
        Shelf* pShelf = [mylibrary.shelfArray objectAtIndex:indexPath.row];
        destViewController.myshelf = pShelf;
        destViewController.shelfNum = indexPath.row;
    }
}


@end
