//
//  Library.m
//  BookApp
//
//  Raghav Haran
//  Code Fellows iOS Challenge 3
//

#import "Library.h"

@implementation Library

@synthesize shelfArray;
@synthesize libraryName;

- (id) init
{
    if(self = [super init])
    {
        shelfArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void) dealloc
{
    [shelfArray removeAllObjects];
    [shelfArray release];
    
    [super dealloc];
}

- (NSInteger) getShelfNumbers
{
    return shelfArray.count;
}

- (void)enshelf:(NSString*)shelfName book:(Book*) book;
{
    NSInteger shelfNum = [shelfArray indexOfObject:shelfName];
    Shelf* pShelf = [shelfArray objectAtIndex:shelfNum];
    [pShelf.bookArray addObject:book];
}

- (void)unshelf:(NSString*)shelfName book:(Book*) book;
{
    NSInteger shelfNum = [shelfArray indexOfObject:shelfName];
    Shelf* pShelf = [shelfArray objectAtIndex:shelfNum];
    [pShelf.bookArray removeObject:book];
}


@end
