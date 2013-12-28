//
//  BookContentViewController.h
//  BookApp
//
//  Raghav Haran
//  Code Fellows iOS Challenge 3
//

#import <UIKit/UIKit.h>

@interface BookContentViewController : UIViewController

@property(nonatomic, assign) NSString*  mytitle;
@property(nonatomic, assign) NSString*  mytext;

@property(nonatomic, assign) IBOutlet UILabel*  lbltitle;
@property(nonatomic, assign) IBOutlet UILabel*  lbltext;

@end
