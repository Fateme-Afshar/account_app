import 'dart:convert';

import 'package:account_app/data/database/schema.dart';
import 'package:hive/hive.dart';


Transaction transactionFromJson(String str) =>
    Transaction.fromJson(json.decode(str));

String transactionToJson(Transaction data) => json.encode(data.toJson());

@HiveType(typeId: TransactionSchema.transactionTypeId)
class Transaction extends HiveObject {
  Transaction({
    this.id,
    this.title,
    this.content,
    this.amount,
    this.date,
    this.image,
    this.isIncrease,
  });

  Transaction.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    amount = json['amount'];
    date = json['date'];
    image = json['image'];
    isIncrease = json['isIncrease'];
  }

  @HiveField(0)
  num? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? content;
  @HiveField(3)
  num? amount;
  @HiveField(4)
  String? date;
  @HiveField(5)
  String? image;
  @HiveField(6)
  bool? isIncrease;

  Transaction copyWith({
    num? id,
    String? title,
    String? content,
    num? amount,
    String? date,
    String? image,
    bool? isIncrease,
  }) =>
      Transaction(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        amount: amount ?? this.amount,
        date: date ?? this.date,
        image: image ?? this.image,
        isIncrease: isIncrease ?? this.isIncrease,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['content'] = content;
    map['amount'] = amount;
    map['date'] = date;
    map['image'] = image;
    map['isIncrease'] = isIncrease;
    return map;
  }
}
