import 'package:account_app/data/database/appDatabase.dart';
import 'package:hive/hive.dart';

import '../../model/creditCard.dart';

class CreditCardRepository {
  late final Box<CreditCard> box;

  void openCreditCardBox() async {
    box = await AppDatabase.initialCreditCardBox();
  }

  Future<void> addCreditCardToDb(CreditCard creditCard) async {
    await box.add(creditCard);
  }

  bool isRepetitiveCreditCardToDb(CreditCard creditCard){
    return box.get(creditCard) == null ? false : true;
  }
}
