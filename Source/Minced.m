#import "Minced.h"
#import "NSString+HYPNetworking.h"

@implementation NSObject (Minced)

- (id)minced_JSONKeysToCamelCase
{
    if ([self isKindOfClass:NSArray.class]) {
        return [self minced_JSONObjectsKeysToCamelCase];
    } else if ([self isKindOfClass:NSDictionary.class]) {
        return [self minced_JSONObjectKeysToCamelCase];
    }

    return self;
}

- (NSArray *)minced_JSONObjectsKeysToCamelCase
{
    NSMutableArray *camelCaseJSON = [NSMutableArray new];

    NSArray *JSONObjects = (NSArray *)self;
    for (NSDictionary *object in JSONObjects) {
        [camelCaseJSON addObject:[object minced_JSONObjectKeysToCamelCase]];
    }

    return [camelCaseJSON copy];
}

- (NSDictionary *)minced_JSONObjectKeysToCamelCase
{
    NSMutableDictionary *camelCaseJSONObject = [NSMutableDictionary new];

    NSDictionary *JSONObject = (NSDictionary *)self;
    [JSONObject enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([obj isKindOfClass:NSArray.class]) {
            camelCaseJSONObject[[key hyp_localString]] = [obj minced_JSONKeysToCamelCase];
        } else if ([obj isKindOfClass:NSDictionary.class]) {
            camelCaseJSONObject[[key hyp_localString]] = [obj minced_JSONObjectKeysToCamelCase];
        } else {
            camelCaseJSONObject[[key hyp_localString]] = obj;
        }
    }];

    return [camelCaseJSONObject copy];
}

@end
