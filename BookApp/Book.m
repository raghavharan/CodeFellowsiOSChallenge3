//
//  Book.m
//  BookApp
//
//  Raghav Haran
//  Code Fellows iOS Challenge 3
//

#import "Book.h"

@implementation Book
@synthesize text;
@synthesize title;

- (id) init
{
    if(self = [super init])
    {
        
    }
    
    return self;
}

- (void) dealloc
{
    [super dealloc];
}


- (void) enshelf:(NSString*) shelfName
{
    if ([self.delegate respondsToSelector:@selector(enshelf:book:)]) {
        [self.delegate enshelf:shelfName book:self];
    }
}

- (void) unshelf:(NSString*) shelfName
{
    if ([self.delegate respondsToSelector:@selector(unshelf:book:)]) {
        [self.delegate unshelf:shelfName book:self];
    }
}


@end
