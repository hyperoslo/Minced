@import XCTest;

#import "NSObject+HYPMinced.h"
#import "JSON.h"

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)testJSONKeys {
    id snakeCaseJSON = [JSON fromFileNamed:@"snakeCaseJSON.json"
                                  inBundle:[NSBundle bundleForClass:[self class]]];
    id camelCaseJSON = [JSON fromFileNamed:@"camelCaseJSON.json"
                                  inBundle:[NSBundle bundleForClass:[self class]]];

    XCTAssertEqualObjects([snakeCaseJSON minced_JSONKeys], camelCaseJSON);
}

- (void)testJSONKeysWithNonnulls {
    id nullSnakeCaseJSON = [JSON fromFileNamed:@"nullSnakeCaseJSON.json"
                                      inBundle:[NSBundle bundleForClass:[self class]]];
    id nonnullCamelCaseJSON = [JSON fromFileNamed:@"nonnullCamelCaseJSON.json"
                                         inBundle:[NSBundle bundleForClass:[self class]]];

    XCTAssertEqualObjects([nullSnakeCaseJSON minced_JSONKeysWithNonnulls], nonnullCamelCaseJSON);
}

- (void)testMincedValuesForKey {
    
}

@end
