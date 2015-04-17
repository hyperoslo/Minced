#import "NSObject+HYPMinced.h"

#import "NSString+HYPNetworking.h"

@implementation NSObject (HYPMinced)

#pragma mark - Public

- (id)minced_JSONKeys {
    return [self minced_JSONKeysWithNonnullValues:NO];
}

- (id)minced_JSONKeysWithNonnulls {
    return [self minced_JSONKeysWithNonnullValues:YES];
}

- (NSArray *)minced_JSONObjectsKeys {
    return [self minced_JSONObjectsKeysWithNonnulls:NO];
}

- (NSArray *)minced_JSONObjectsKeysWithNonnulls {
    return [self minced_JSONObjectsKeysWithNonnulls:YES];
}

- (NSDictionary *)minced_JSONObjectKeys {
    return [self minced_JSONObjectKeysWithNonnulls:NO];
}

- (NSDictionary *)minced_JSONObjectKeysWithNonnulls {
    return [self minced_JSONObjectKeysWithNonnulls:YES];
}

#pragma mark - Private

- (id)minced_JSONKeysWithNonnullValues:(BOOL)unnullify {
    if ([self isKindOfClass:[NSArray class]]) {
        return [self minced_JSONObjectsKeysWithNonnulls:unnullify];
    } else if ([self isKindOfClass:[NSDictionary class]]) {
        return [self minced_JSONObjectKeysWithNonnulls:unnullify];
    }

    return self;
}

- (NSArray *)minced_JSONObjectsKeysWithNonnulls:(BOOL)unnullify {
    NSMutableArray *camelCaseJSON = [NSMutableArray new];

    NSArray *JSONObjects = (NSArray *)self;
    for (NSDictionary *object in JSONObjects) {
        [camelCaseJSON addObject:[object minced_JSONObjectKeysWithNonnulls:unnullify]];
    }

    return [camelCaseJSON copy];
}

- (NSDictionary *)minced_JSONObjectKeysWithNonnulls:(BOOL)unnullify {
    NSMutableDictionary *camelCaseJSONObject = [NSMutableDictionary new];

    NSDictionary *JSONObject = (NSDictionary *)self;
    [JSONObject enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([obj isKindOfClass:NSArray.class]) {
            camelCaseJSONObject[[key hyp_localString]] = [obj minced_JSONKeysWithNonnullValues:unnullify];
        } else if ([obj isKindOfClass:NSDictionary.class]) {
            camelCaseJSONObject[[key hyp_localString]] = [obj minced_JSONObjectKeysWithNonnulls:unnullify];
        } else if (unnullify) {
            camelCaseJSONObject[[key hyp_localString]] = (obj == nil || [obj isKindOfClass:NSNull.class]) ? @"" : obj;
        } else {
            camelCaseJSONObject[[key hyp_localString]] = obj;
        }
    }];

    return [camelCaseJSONObject copy];
}

@end
