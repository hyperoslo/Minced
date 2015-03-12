@import Foundation;

@interface Minced : NSObject

+ (id)toCamelCaseJSON:(id)JSON;

+ (NSArray *)toCamelCaseJSONObjects:(NSArray *)JSONObjects;

+ (NSDictionary *)toCamelCaseJSONObject:(NSDictionary *)JSONObject;

@end
