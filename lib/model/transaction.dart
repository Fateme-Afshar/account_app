import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'transaction.freezed.dart';

@freezed
class Transaction with _$Transaction{
  const factory Transaction({
    required String title,
    required String counter,
    required int amount,
    required String date,
    required String image,
    required bool isIncrease
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, Object?> json)
  => _$TransactionFromJson(json);
}