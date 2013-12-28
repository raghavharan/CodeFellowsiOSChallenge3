//
//  Library.h
//  BookApp
//
//  Raghav Haran
//  Code Fellows iOS Challenge 3
//

#import <Foundation/Foundation.h>

#import "Shelf.h"

@interface Library : NSObject<BookDelegate>

{
    NSMutableArray* shelfArray;
    
    NSString*   libraryName;
}

@property(nonatomic, retain) NSMutableArray*    shelfArray;
@property(nonatomic, retain) NSString*    libraryName;

- (NSInteger) getShelfNumbers;

@end
