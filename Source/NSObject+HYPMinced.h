@import Foundation;

@interface NSObject (HYPMinced)

- (id)minced_JSONKeysToCamelCase;
- (id)minced_JSONKeysToCamelCaseWithValuesUnnullified;

- (NSArray *)minced_JSONObjectsKeysToCamelCase;
- (NSArray *)minced_JSONObjectsKeysToCamelCaseWithValuesUnnullified;

- (NSDictionary *)minced_JSONObjectKeysToCamelCase;
- (NSDictionary *)minced_JSONObjectKeysToCamelCaseWithValuesUnnullified;

@end
