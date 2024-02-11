import 'package:flutter/services.dart';

Future<String> loadJsonTransactionFromAssets() async{
  var jsonTxt= await rootBundle.loadString("assets/mock_data/mock_transactions.json");

  return jsonTxt;
}