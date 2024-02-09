import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'card.freezed.dart';

@freezed
class Card with _$Card{
  const factory Card({
    required String title,
    required String counter,
    required int amount,
    required String date,
    required String image,
    required bool isIncrease
  }) = _Card;
}