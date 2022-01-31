part of 'package:nordigen_integration/nordigen_integration.dart';

/// Category Data Model for Nordigen
///
/// Refer https://nordigen.com/en/categorisation_and_insights_documentation/api_documentation/endpoints/parameters-and-responses/
class CategoryData {
  const CategoryData({
    required this.id,
    required this.level,
    required this.parentId,
    required this.readableTitle,
    required this.type,
  });

  /// For easy Data Model Generation from Map fetched by querying Nordigen.
  ///
  /// Since Nordigen does not provide a detailed table of the parameters
  /// of a category object, this is only an assumption of the data structure
  /// derived from the example provided by Nordigen.
  factory CategoryData.fromMap(dynamic fetchedMap) => CategoryData(
        id: fetchedMap['id'] as int,
        level: fetchedMap['level'] as int,
        parentId: fetchedMap['parent_id'] as int,
        readableTitle: fetchedMap['readable_title'] as String,
        type: _enumDecode(_categoryTypeEnumMap, fetchedMap['type']),
      );

  /// Forms a [Map] of [String] keys and [dynamic] values from Class Data.
  ///
  /// Map Keys: https://nordigen.com/en/categorisation_and_insights_documentation/api_documentation/endpoints/parameters-and-responses/
  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'level': level,
        'parent_id': parentId,
        'readable-title': readableTitle,
        'type': _categoryTypeEnumMap[type],
      };

  /// Unique ID of the Category
  final int id;

  /// Level of the Category in the Category Tree
  final int level;

  /// ID of the parent Category
  final int parentId;

  /// Readable title of the Category
  final String readableTitle;

  /// Type of the Category
  /// Possible values:
  /// - [CategoryType.expense]
  /// - [CategoryType.income]
  final CategoryType type;
}

/// Types of categories
enum CategoryType {
  expense,
  income,
}

/// Enum Converter to Map for [CategoryType]
const Map<CategoryType, String> _categoryTypeEnumMap = <CategoryType, String>{
  CategoryType.expense: 'expense',
  CategoryType.income: 'income',
};

/// Returns the key associated with value [source] from [enumValues], if one
/// exists.
///
/// If [unknownValue] is not `null` and [source] is not a value in [enumValues],
/// [unknownValue] is returned. Otherwise, an [ArgumentError] is thrown.
///
/// If [source] is `null`, an [ArgumentError] is thrown.
K _enumDecode<K extends Enum, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  for (MapEntry<K, V> entry in enumValues.entries) {
    if (entry.value == source) {
      return entry.key;
    }
  }

  if (unknownValue == null) {
    throw ArgumentError(
      '`$source` is not one of the supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return unknownValue;
}
