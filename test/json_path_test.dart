/*
Confirming understanding of the [JSONPath](https://pub.dev/packages/json_path) package.
 */

import 'dart:convert' show json;

import 'package:flutter_test/flutter_test.dart';
import 'package:json_path/json_path.dart';

void main() {
  group('query example', () {
    var _jsonSource;
    JsonPath _pricesQuery;
    Iterable _priceMatches;

    setUp((){
      _jsonSource = json.decode('''
{
  "store": {
    "book": [
      {
        "category": "reference",
        "author": "Nigel Rees",
        "title": "Sayings of the Century",
        "price": 8.95
      },
      {
        "category": "fiction",
        "author": "Evelyn Waugh",
        "title": "Sword of Honour",
        "price": 12.99
      },
      {
        "category": "fiction",
        "author": "Herman Melville",
        "title": "Moby Dick",
        "isbn": "0-553-21311-3",
        "price": 8.99
      },
      {
        "category": "fiction",
        "author": "J. R. R. Tolkien",
        "title": "The Lord of the Rings",
        "isbn": "0-395-19395-8",
        "price": 22.99
      }
    ],
    "bicycle": {
      "color": "red",
      "price": 19.95
    }
  }
}  
  ''');
    });

    test('example query runs as expected', (){
      _pricesQuery = JsonPath(r'$..price');
      _priceMatches = _pricesQuery.read(_jsonSource);
      expect(_priceMatches, TypeMatcher<Iterable>());
      expect(_priceMatches.length, 5);
    });

    test('can produce a list of doubles with the prices', () {
      _pricesQuery = JsonPath(r'$..price');
      _priceMatches = _pricesQuery.read(_jsonSource);
      final listOfPrices = List<double>.from(_priceMatches.map((e)=>e.value).toList());
      expect(listOfPrices, TypeMatcher<List<double>>());
      expect(listOfPrices.length, 5);
    });
  });
}
