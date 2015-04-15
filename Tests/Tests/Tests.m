@import XCTest;

#import "NSObject+HYPMinced.h"

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)testJSONKeys
{
    id snakeCaseJSON = [self serializedJSON:@"snakeCaseJSON"];
    id camelCaseJSON = [self serializedJSON:@"camelCaseJSON"];

    XCTAssertEqualObjects([snakeCaseJSON minced_JSONKeys], camelCaseJSON);
}

- (void)testJSONObjectKeysWithNonnulls
{
    id nullSnakeCaseJSON = [self serializedJSON:@"nullSnakeCaseJSON"];
    id nonnullCamelCaseJSON = [self serializedJSON:@"nonnullCamelCaseJSON"];

    XCTAssertEqualObjects([nullSnakeCaseJSON minced_JSONKeysWithNonnulls], nonnullCamelCaseJSON);
}

- (id)serializedJSON:(NSString *)resource
{
    NSString *JSONFilePath = [[NSBundle bundleForClass:self.class] pathForResource:resource ofType:@"json"];
    NSData *JSONData = [[NSData alloc] initWithContentsOfFile:JSONFilePath];
    NSError *error = nil;

    return [NSJSONSerialization JSONObjectWithData:JSONData
                                           options:kNilOptions
                                             error:&error];
}

@end
