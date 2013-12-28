//
//  Shelf.m
//  BookApp
//
//  Raghav Haran
//  Code Fellows iOS Challenge 3
//

#import "Shelf.h"

@implementation Shelf

@synthesize bookArray;
@synthesize shelfName;

- (id) init
{
    if(self = [super init])
    {
        bookArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void) dealloc
{
    [bookArray removeAllObjects];
    [bookArray release];
    
    [super dealloc];
}

- (NSInteger) getBookNumbers
{
    return bookArray.count;
}

- (Book*) create
{
    Book* pBook = [[Book alloc] init];
    pBook.title = [NSString stringWithFormat:@"Book-%ld", bookArray.count];
    return pBook;
}

- (NSString*) read:(NSInteger) index
{
    Book* pBook = [bookArray objectAtIndex:index];
    return pBook.text;
}

- (void) update:(NSInteger)index text:(NSString*) text
{
    Book* pBook = [bookArray objectAtIndex:index];
    pBook.text = text;
    
}

- (void) deleteBook:(NSInteger) index
{
    [bookArray removeObjectAtIndex:index];
}

@end
