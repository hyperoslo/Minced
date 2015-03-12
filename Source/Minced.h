@import Foundation;

@interface NSObject (Minced)

- (id)minced_JSONKeysToCamelCase;

- (NSArray *)minced_JSONObjectsKeysToCamelCase;

- (NSDictionary *)minced_JSONObjectKeysToCamelCase;

@end
