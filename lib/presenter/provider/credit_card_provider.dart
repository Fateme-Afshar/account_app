import 'package:account_app/model/creditCard.dart';
import 'package:account_app/data/repository/credit_card_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../di/setup.dart';

class CreditCardProvider with ChangeNotifier {
  final List<CreditCard> _cardList = [];
  final repository = getIt.get<CreditCardRepository>();

  List<CreditCard> get cards => _cardList;

  void addCard(CreditCard creditCard) {
    if (repository.isRepetitiveCreditCardToDb(creditCard)) {
      _cardList.add(creditCard);
      repository.addCreditCardToDb(creditCard);
    }
    notifyListeners();
  }
}
