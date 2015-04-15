@import Foundation;

@interface NSObject (HYPMinced)

- (id)minced_JSONKeys;
- (id)minced_JSONKeysWithValuesUnnullified;

- (NSArray *)minced_JSONObjectsKeys;
- (NSArray *)minced_JSONObjectsKeysWithNonnulls;

- (NSDictionary *)minced_JSONObjectKeys;
- (NSDictionary *)minced_JSONObjectKeysWithNonnulls;

@end
