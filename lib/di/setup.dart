import 'package:account_app/data/repository/credit_card_repository.dart';
import 'package:account_app/data/repository/transaction_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> diSetup() async{
  getIt.registerSingleton<CreditCardRepository>(CreditCardRepository());
  getIt.registerSingleton<TransactionRepository>(TransactionRepository());
}