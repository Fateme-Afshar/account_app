import 'package:account_app/data/database/appDatabase.dart';
import 'package:account_app/di/setup.dart';
import 'package:account_app/presenter/home.dart';
import 'package:account_app/presenter/provider/credit_card_provider.dart';
import 'package:account_app/data/repository/credit_card_repository.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'model/creditCard.dart';

final repository = getIt.get<CreditCardRepository>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => CreditCardProvider(),
      child: const MyApp(),
    ),
  );
  await diSetup();
  await AppDatabase.initialDatabase();
  await repository.openCreditCardBox();
  Hive.registerAdapter(CreditCardAdapter());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 124, 156, 185)),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                  color: Color.fromARGB(255, 124, 156, 185),
                  fontSize: 24,
              ),
              iconTheme: IconThemeData(
                  color: Color.fromARGB(255, 124, 156, 185), size: 30))),
      home: Home(),
    );
  }
}
