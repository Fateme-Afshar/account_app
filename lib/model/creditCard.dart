import 'dart:convert';

import 'package:account_app/data/database/schema.dart';
import 'package:hive/hive.dart';

CreditCard cardFromJson(String str) => CreditCard.fromJson(json.decode(str));

String cardToJson(CreditCard data) => json.encode(data.toJson());

@HiveType(typeId: CreditCardSchema.cardTypeId)
class CreditCard extends HiveObject {
  CreditCard({
    this.id,
    this.transactionId,
    this.name,
    this.cardNumber,
    this.dateExpire,
    this.bankName,
  });

  CreditCard.fromJson(dynamic json) {
    id = json['id'];
    transactionId = json['transactionId'];
    name = json['name'];
    cardNumber = json['cardNumber'];
    dateExpire = json['dateExpire'];
    bankName = json['bankName'];
  }

  @HiveField(0)
  num? id;
  @HiveField(1)
  num? transactionId;
  @HiveField(2)
  String? name;
  @HiveField(3)
  String? cardNumber;
  @HiveField(4)
  String? dateExpire;
  @HiveField(5)
  String? bankName;

  CreditCard copyWith({
    num? id,
    num? transactionId,
    String? name,
    String? cardNumber,
    String? dateExpire,
    String? bankName,
  }) =>
      CreditCard(
        id: id ?? this.id,
        transactionId: transactionId ?? this.transactionId,
        name: name ?? this.name,
        cardNumber: cardNumber ?? this.cardNumber,
        dateExpire: dateExpire ?? this.dateExpire,
        bankName: bankName ?? this.bankName,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['transactionId'] = transactionId;
    map['name'] = name;
    map['cardNumber'] = cardNumber;
    map['dateExpire'] = dateExpire;
    map['bankName'] = bankName;
    return map;
  }
}
