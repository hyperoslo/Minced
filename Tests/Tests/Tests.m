@import XCTest;

#import "Minced.h"

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)testToCamelCaseJSON
{
    NSString *snakeCaseJSONFilePath = [[NSBundle bundleForClass:self.class] pathForResource:@"snakeCaseJSON"
                                                                                     ofType:@"json"];

    NSString *camelCaseJSONFilePath = [[NSBundle bundleForClass:self.class] pathForResource:@"camelCaseJSON"
                                                                                     ofType:@"json"];

    NSData *snakeCaseJSONData = [[NSData alloc] initWithContentsOfFile:snakeCaseJSONFilePath];
    NSData *camelCaseJSONData = [[NSData alloc] initWithContentsOfFile:camelCaseJSONFilePath];

    NSError *error1 = nil;
    NSError *error2 = nil;

    id snakeCaseJSON = [NSJSONSerialization JSONObjectWithData:snakeCaseJSONData
                                                       options:kNilOptions
                                                         error:&error1];

    id camelCaseJSON = [NSJSONSerialization JSONObjectWithData:camelCaseJSONData
                                                       options:kNilOptions
                                                         error:&error2];

    XCTAssertEqualObjects([Minced toCamelCaseJSON:snakeCaseJSON], camelCaseJSON);
}

@end
