
import 'dart:convert';

import 'package:account_app/data/mock_data/transaction_mock_data.dart';
import 'package:account_app/model/transaction.dart';

class TransactionRepository {
  Future<List<Transaction>> decodeJsonStr() async{
    var jsonStr=await loadJsonTransactionFromAssets();
    List<dynamic> jsonList=json.decode(jsonStr);

    List<Transaction> transactionList = jsonList
        .map((jsonItem) => Transaction.fromJson(jsonItem))
        .toList();

    return transactionList;
  }
}