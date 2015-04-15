# Minced

[![CI Status](http://img.shields.io/travis/hyperoslo/Minced.svg?style=flat)](https://travis-ci.org/hyperoslo/Minced)
[![Version](https://img.shields.io/cocoapods/v/Minced.svg?style=flat)](http://cocoadocs.org/docsets/Minced)
[![License](https://img.shields.io/cocoapods/l/Minced.svg?style=flat)](http://cocoadocs.org/docsets/Minced)
[![Platform](https://img.shields.io/cocoapods/p/Minced.svg?style=flat)](http://cocoadocs.org/docsets/Minced)

> Mincing is a food preparation technique in which food ingredients are finely divided into uniform pieces.

Minced converts JSON keys to camelCase an adds support for replacement of JSON null values with empty strings.

This is especially useful as a workaround for avoiding crashes due to null values when using Realm. More info: [Issue #628](https://github.com/realm/realm-cocoa/issues/628)

## Usage

```objc
// Converts all the keys in the JSON to camelCase
- (id)minced_JSONKeysToCamelCase;
- (NSArray *)minced_JSONObjectsKeysToCamelCase;
- (NSDictionary *)minced_JSONObjectKeysToCamelCase;

// Converts all the keys in the JSON to camelCase and replaces null values with an empty string
- (id)minced_JSONKeysToCamelCaseWithValuesUnnullified;
- (NSArray *)minced_JSONObjectsKeysToCamelCaseWithValuesUnnullified;
- (NSDictionary *)minced_JSONObjectKeysToCamelCaseWithValuesUnnullified;
```

## Example

```json
{
  "web_widgets": [
    {
      "created_at": null,
      "updated_at": "2015-03-11",
      "window": {
        "title": null,
        "name": "hyper_window",
        "width": 666,
        "height": 666
      },
    },
    {
      "created_at": null,
      "updated_at": "2015-03-12",
      "panel": {
        "title": null,
        "name": "hyper_panel",
        "width": 777,
        "height": 777
      }
    }
  ]
}
```

## Installation

**Minced** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

`pod 'Minced'`

## Author

Hyper Interaktiv AS, teknologi@hyper.no

## License

**Minced** is available under the MIT license. See the LICENSE file for more info.
