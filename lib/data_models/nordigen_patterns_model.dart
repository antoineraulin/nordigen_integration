part of 'package:nordigen_integration/nordigen_integration.dart';

/// Find transaction regularity, matching and anomaly patterns
class Patterns {
  const Patterns({
    required this.regularTransaction,
    required this.oppositeMatch,
  });

  factory Patterns.fromMap(dynamic fetchedMap) => Patterns(
        regularTransaction: fetchedMap['regularTransaction']?['value'] as bool?,
        oppositeMatch: fetchedMap['oppositeMatch']?['value'] as bool?,
      );

  Map<String, bool?> toMap() => <String, bool?>{
        'regularTransaction': regularTransaction,
        'oppositeMatch': oppositeMatch,
      };

  /// If True, transaction has recurring nature.
  final bool? regularTransaction;

  /// If True,
  /// transaction has a matching transaction with an opposite amount sign
  final bool? oppositeMatch;
}
