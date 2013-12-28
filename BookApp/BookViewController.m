//
//  LibraryViewController.m
//  BookApp
//
//  Raghav Haran
//  Code Fellows iOS Challenge 3
//

#import "BookViewController.h"
#import "BookContentViewController.h"

@interface BookViewController ()

@end

@implementation BookViewController

@synthesize mylibrary;
@synthesize myshelf;
@synthesize navitem;
@synthesize shelfNum;
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
    myshelf.bookArray = [[NSMutableArray alloc] init];
    for(int i = 0; i < 10 ;i++)
    {
        Book* pBook = [[Book alloc] init];
        pBook.title = [NSString stringWithFormat:@"Book-%d", i + 1];
        pBook.text = [NSString stringWithFormat:@"This book sits on %@ of %@. \n\n This is sample book's text.", myshelf.shelfName, mylibrary.libraryName];
        
        [myshelf.bookArray addObject:pBook];
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
    return [myshelf.bookArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier2 = @"BookTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier2];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier2];
    }
    
    Book* pBook = [myshelf.bookArray objectAtIndex:indexPath.row];

    cell.textLabel.text = pBook.title;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showBookContent"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BookContentViewController *destViewController = (BookContentViewController *)segue.destinationViewController;

        Book* pBook = [myshelf.bookArray objectAtIndex:indexPath.row];
        
        destViewController.mytitle = pBook.title;
        destViewController.mytext = pBook.text;
    }
}

@end
