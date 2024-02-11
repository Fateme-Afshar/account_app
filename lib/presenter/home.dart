import 'package:account_app/data/repository/transaction_repository.dart';
import 'package:account_app/di/setup.dart';
import 'package:account_app/model/transaction.dart';
import 'package:account_app/model/creditCard.dart';
import 'package:account_app/presenter/provider/credit_card_provider.dart';
import 'package:account_app/widgets/credit_card_widget.dart';
import 'package:account_app/widgets/custom_input.dart';
import 'package:account_app/widgets/custom_widget_build_methods.dart';
import 'package:account_app/widgets/transaction_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final transactionRepository = getIt.get<TransactionRepository>();

  @override
  Widget build(BuildContext context) {
    late String creditCardNumber;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Credit Cards'),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(
              child: Image(image: AssetImage('assets/profile.png')),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Row(
              children: [
                buildTitle("Cards"),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          color: Colors.white,
                          child: Column(
                            children: [
                              CustomTextInput(
                                  hint: "Card number",
                                  onChanged: (value) {
                                    creditCardNumber = value;
                                  }),
                              ElevatedButton(
                                onPressed: () {
                                  if (creditCardNumber.length != 16) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Card number has 16 number.'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  } else {
                                    Provider.of<CreditCardProvider>(context,
                                            listen: false)
                                        .addCard(CreditCard(
                                            name: "Fateme Afshar",
                                            cardNumber: creditCardNumber,
                                            dateExpire: "2/2024"));
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    textStyle: const TextStyle(fontSize: 18),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                child: const Text("Add"),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: Text('ADD NEW'),
                      ),
                      Icon(Icons.add),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(child: Consumer<CreditCardProvider>(
            builder: (context, creditCardProvider, child) {
              final creditCards = creditCardProvider.cards;

              return CarouselSlider(
                options:
                    CarouselOptions(height: 200.0, enlargeCenterPage: true),
                items: creditCards.map((card) {
                  return Builder(
                    builder: (BuildContext context) {
                      return CreditCardWidget(
                        creditCard: card,
                      );
                    },
                  );
                }).toList(),
              );
            },
          )),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: buildTitle("Transactions"),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                child: Icon(Icons.more_horiz),
              ),
            ],
          ),
          Expanded(
              child: FutureBuilder<List<Transaction>>(
            future: transactionRepository.decodeJsonStr(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Transaction>> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isNotEmpty) {
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return TransactionWidget(
                          transaction: snapshot.data![index],
                        );
                      });
                } else {
                  return const Text("Nothing to show");
                }
              } else {
                return const Text("Nothing to show");
              }
            },
          ))
        ],
      ),
    );
  }
}
