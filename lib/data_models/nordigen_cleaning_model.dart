part of 'package:nordigen_integration/nordigen_integration.dart';

/// Clean transaction data
///
/// Refer https://nordigen.com/en/docs/account-information/premium/cleaning/
class Cleaning {
  const Cleaning({
    this.merchantName,
    this.merchantCategoryCode,
    required this.transactionType,
    this.invoiceNumber,
  });

  /// For easy Data Model Generation from Map fetched by querying Nordigen.
  factory Cleaning.fromMap(dynamic fetchedMap) => Cleaning(
        merchantName: fetchedMap['merchantName'] as String?,
        merchantCategoryCode: fetchedMap['merchantCategoryCode'] as int?,
        transactionType: _enumDecode(
          _transactionTypeEnumMap,
          fetchedMap['transactionType'] ?? 'OTHER',
        ),
        invoiceNumber: fetchedMap['invoiceNumber'] as String?,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'merchantName': merchantName,
        'merchantCategoryCode': merchantCategoryCode,
        'transactionType': _transactionTypeEnumMap[transactionType],
        'invoiceNumber': invoiceNumber,
      };

  /// Name of the merchant
  final String? merchantName;

  /// A four-digit number (ISO 18245) to classify merchants and businesses.
  ///
  /// coming-soon
  final int? merchantCategoryCode;

  final TransactionType transactionType;

  /// Invoice number listed in transaction reference
  ///
  /// coming-soon
  final String? invoiceNumber;
}

enum TransactionType {
  payment,
  transfer,
  refund,
  atm,
  other,
}

/// Enum Converter to Map for [TransactionType]
const Map<TransactionType, String> _transactionTypeEnumMap =
    <TransactionType, String>{
  TransactionType.payment: 'PAYMENT',
  TransactionType.transfer: 'TRANSFER',
  TransactionType.refund: 'REFUND',
  TransactionType.atm: 'ATM',
  TransactionType.other: 'OTHER',
};
