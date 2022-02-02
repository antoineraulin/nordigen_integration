part of 'package:nordigen_integration/nordigen_integration.dart';

/// Enriched transaction data
///
/// Refer https://nordigen.com/en/docs/account-information/premium/enrichment/
class Enrichment {
  const Enrichment({
    required this.contacts,
    required this.description,
    this.logo,
    this.name,
    this.website,
  });

  factory Enrichment.fromMap(dynamic fetchedMap) => Enrichment(
        contacts: EnrichmentContacts.fromMap(fetchedMap['contacts']!),
        description: EnrichmentDescription.fromMap(fetchedMap['description']!),
        logo: fetchedMap['logo'] as String?,
        name: fetchedMap['name'] as String?,
        website: fetchedMap['website'] as String?,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'contacts': contacts.toMap(),
        'description': description.toMap(),
        'logo': logo,
        'name': name,
        'website': website,
      };

  /// Contact details of the merchant
  final EnrichmentContacts contacts;

  /// Description of the merchant
  final EnrichmentDescription description;

  /// URL of the merchant's logo.
  final String? logo;

  /// Name of the merchant.
  final String? name;

  /// URL of the merchant's website. Can be null.
  final String? website;
}

/// Contact details of the merchant
class EnrichmentContacts {
  const EnrichmentContacts({
    this.addressUnstructured,
    this.phone,
    this.title,
  });

  factory EnrichmentContacts.fromMap(dynamic fetchedMap) => EnrichmentContacts(
        addressUnstructured: fetchedMap['addressUnstructured'] as String?,
        phone: fetchedMap['phone'] as String?,
        title: fetchedMap['title'] as String?,
      );

  Map<String, String?> toMap() => <String, String?>{
        'addressUnstructured': addressUnstructured,
        'phone': phone,
        'title': title,
      };

  /// Address associated with the merchant.
  final String? addressUnstructured;

  /// Phone number associated with the merchant.
  final String? phone;

  /// Another title for the merchant
  /// if associated with specific address or phone number.
  final String? title;
}

/// Description of the merchant
class EnrichmentDescription {
  const EnrichmentDescription({
    this.subtitle,
    this.summary,
  });

  factory EnrichmentDescription.fromMap(dynamic fetchedMap) =>
      EnrichmentDescription(
        subtitle: fetchedMap['subtitle'] as String?,
        summary: fetchedMap['summary'] as String?,
      );

  Map<String, String?> toMap() => <String, String?>{
        'subtitle': subtitle,
        'summary': summary,
      };

  /// One-line descriptive summary of merchant.
  final String? subtitle;

  /// Longer description of merchant.
  final String? summary;
}
