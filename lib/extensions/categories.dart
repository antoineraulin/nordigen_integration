part of 'package:nordigen_integration/nordigen_integration.dart';

extension NordigenCategorisationEndpoints on NordigenPremiumAPI {
  /// Retrieve the latest category tree
  ///
  /// [country] : Two letter country code filter for categories
  Future<List<CategoryData>> getCategoryTree({
    required String country,
  }) async {
    assert(country.isNotEmpty);
    assert(country.length == 2);

    // Make GET request and fetch output.
    final dynamic fetchedData = await _nordigenGetter(
      endpointUrl: 'https://api.nordigen.com/v2/category-tree/$country',
    );

    // Convert fetched data to a list of CategoryData objects.
    List<dynamic> rawCategories =
        fetchedData['data']['attributes']['categories'];
    return rawCategories
        .map((dynamic rawCategory) => CategoryData.fromMap(rawCategory))
        .toList();
  }
}
