#import "NSObject+HYPMinced.h"

#import "NSString+HYPNetworking.h"

@implementation NSObject (HYPMinced)

#pragma mark - Public

- (id)minced_JSONKeysToCamelCase
{
    return [self minced_JSONKeysToCamelCaseWithValuesUnnillified:NO];
}

- (id)minced_JSONKeysToCamelCaseWithValuesUnnullified
{
    return [self minced_JSONKeysToCamelCaseWithValuesUnnillified:YES];
}

- (NSArray *)minced_JSONObjectsKeysToCamelCase
{
    return [self minced_JSONObjectsKeysToCamelCaseWithValuesUnnullified:NO];
}

- (NSArray *)minced_JSONObjectsKeysToCamelCaseWithValuesUnnullified
{
    return [self minced_JSONObjectsKeysToCamelCaseWithValuesUnnullified:YES];
}

- (NSDictionary *)minced_JSONObjectKeysToCamelCase
{
    return [self minced_JSONObjectKeysToCamelCaseWithValuesUnnullified:NO];
}

- (NSDictionary *)minced_JSONObjectKeysToCamelCaseWithValuesUnnullified
{
    return [self minced_JSONObjectKeysToCamelCaseWithValuesUnnullified:YES];
}

#pragma mark - Private

- (id)minced_JSONKeysToCamelCaseWithValuesUnnillified:(BOOL)unnullify
{
    if ([self isKindOfClass:NSArray.class]) {
        return [self minced_JSONObjectsKeysToCamelCaseWithValuesUnnullified:unnullify];
    } else if ([self isKindOfClass:NSDictionary.class]) {
        return [self minced_JSONObjectKeysToCamelCaseWithValuesUnnullified:unnullify];
    }

    return self;
}

- (NSArray *)minced_JSONObjectsKeysToCamelCaseWithValuesUnnullified:(BOOL)unnullify
{
    NSMutableArray *camelCaseJSON = [NSMutableArray new];

    NSArray *JSONObjects = (NSArray *)self;
    for (NSDictionary *object in JSONObjects) {
        [camelCaseJSON addObject:[object minced_JSONObjectKeysToCamelCaseWithValuesUnnullified:unnullify]];
    }

    return [camelCaseJSON copy];
}

- (NSDictionary *)minced_JSONObjectKeysToCamelCaseWithValuesUnnullified:(BOOL)unnullify
{
    NSMutableDictionary *camelCaseJSONObject = [NSMutableDictionary new];

    NSDictionary *JSONObject = (NSDictionary *)self;
    [JSONObject enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([obj isKindOfClass:NSArray.class]) {
            camelCaseJSONObject[[key hyp_localString]] = [obj minced_JSONKeysToCamelCaseWithValuesUnnillified:unnullify];
        } else if ([obj isKindOfClass:NSDictionary.class]) {
            camelCaseJSONObject[[key hyp_localString]] = [obj minced_JSONObjectKeysToCamelCaseWithValuesUnnullified:unnullify];
        } else if (unnullify) {
            camelCaseJSONObject[[key hyp_localString]] = (obj == nil || [obj isKindOfClass:NSNull.class]) ? @"" : obj;
        } else {
            camelCaseJSONObject[[key hyp_localString]] = obj;
        }
    }];

    return [camelCaseJSONObject copy];
}

@end
