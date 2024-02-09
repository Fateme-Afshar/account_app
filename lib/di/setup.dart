import 'package:account_app/presenter/provider/credit_card_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> diSetup() async{
  getIt.registerSingleton<CreditCardRepository>(CreditCardRepository());
}