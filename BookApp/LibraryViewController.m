//
//  ViewController.m
//  BookApp
//
//  Raghav Haran
//  Code Fellows iOS Challenge 3
//

#import "LibraryViewController.h"
#import "ShelfViewController.h"

@interface LibraryViewController ()

@end

@implementation LibraryViewController
{
    NSMutableArray *libraryArray;
}
@synthesize tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    libraryArray = [[NSMutableArray alloc] init];
    for(int i = 0; i < 10 ;i++)
    {
        Library* pLibrary = [[Library alloc] init];
        pLibrary.libraryName = [NSString stringWithFormat:@"Library-%d", i + 1];
        [libraryArray addObject:pLibrary];
        [pLibrary release];
    }
}

- (void) viewDidUnload
{
    for(int i = 0; i < libraryArray.count; i++)
    {
        Library* pLibrary = [libraryArray objectAtIndex:i];
        [pLibrary.shelfArray removeAllObjects];
        [pLibrary.shelfArray release];
    }
    [libraryArray removeAllObjects];
    [libraryArray release];
    
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [libraryArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"LibraryTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    Library* pLibrary = [libraryArray objectAtIndex:indexPath.row];
    cell.textLabel.text = pLibrary.libraryName;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showShelfTable"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ShelfViewController *destViewController = (ShelfViewController *)segue.destinationViewController;
        Library* pLibrary = [libraryArray objectAtIndex:indexPath.row];
        destViewController.mylibrary = pLibrary;
    }
}

@end
