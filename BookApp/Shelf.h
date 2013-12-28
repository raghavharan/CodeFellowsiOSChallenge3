//
//  Shelf.h
//  BookApp
//
//  Raghav Haran
//  Code Fellows iOS Challenge 3
//

#import <Foundation/Foundation.h>

#import "Book.h"
@interface Shelf : NSObject
{
    NSMutableArray*   bookArray;
    
    NSString*   shelfName;
}

@property(nonatomic, retain) NSMutableArray*    bookArray;
@property(nonatomic, retain) NSString*   shelfName;

- (Book*) create;
- (NSString*) read:(NSInteger) index;
- (void) update:(NSInteger)index text:(NSString*) text;
- (void) deleteBook:(NSInteger) index;

@end
