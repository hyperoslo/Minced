#import "Minced.h"
#import "NSString+HYPNetworking.h"

@implementation Minced

+ (id)toCamelCaseJSON:(id)JSON
{
    if ([JSON isKindOfClass:NSArray.class]) {
        return [self toCamelCaseJSONObjects:JSON];
    } else if ([JSON isKindOfClass:NSDictionary.class]) {
        return [self toCamelCaseJSONObject:JSON];
    }

    return JSON;
}

+ (NSArray *)toCamelCaseJSONObjects:(NSArray *)JSONObjects
{
    NSMutableArray *camelCaseJSON = [NSMutableArray new];

    for (NSDictionary *object in JSONObjects) {
        [camelCaseJSON addObject:[self toCamelCaseJSONObject:object]];
    }

    return [camelCaseJSON copy];
}

+ (NSDictionary *)toCamelCaseJSONObject:(NSDictionary *)JSONObject
{
    NSMutableDictionary *camelCaseJSONObject = [NSMutableDictionary new];

    [JSONObject enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([obj isKindOfClass:NSArray.class]) {
            camelCaseJSONObject[[key hyp_localString]] = [self toCamelCaseJSON:obj];
        } else if ([obj isKindOfClass:NSDictionary.class]) {
            camelCaseJSONObject[[key hyp_localString]] = [self toCamelCaseJSONObject:obj];
        } else {
            camelCaseJSONObject[[key hyp_localString]] = obj;
        }
    }];

    return [camelCaseJSONObject copy];
}

@end
