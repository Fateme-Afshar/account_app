import 'package:account_app/data/database/schema.dart';
import 'package:account_app/model/Transaction.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../../model/creditCard.dart';

class AppDatabase {
  static initialDatabase() async => await Hive.initFlutter();

  static Future<Box<CreditCard>> initialCreditCardBox() async =>
      await Hive.openBox<CreditCard>(CreditCardSchema.cardBoxName);
}
