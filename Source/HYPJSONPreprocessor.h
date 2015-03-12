@import Foundation;

@interface HYPJSONPreprocessor : NSObject

+ (id)toCamelCaseJSON:(id)JSON;

+ (NSArray *)toCamelCaseJSONObjects:(NSArray *)JSONObjects;

+ (NSDictionary *)toCamelCaseJSONObject:(NSDictionary *)JSONObject;

@end
