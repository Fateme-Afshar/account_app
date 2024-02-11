import 'package:account_app/data/repository/transaction_repository.dart';
import 'package:account_app/di/setup.dart';
import 'package:account_app/errorHandle/Error.dart';
import 'package:account_app/errorHandle/ErrorTypes.dart';
import 'package:account_app/errorHandle/Validation.dart';
import 'package:account_app/model/transaction.dart';
import 'package:account_app/model/creditCard.dart';
import 'package:account_app/presenter/provider/credit_card_provider.dart';
import 'package:account_app/widgets/credit_card_widget.dart';
import 'package:account_app/widgets/custom_button.dart';
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
    late String creditCardNumber="";
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
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 4, 0, 8),
                                child: CustomTextInput(
                                    hint: "Card number",
                                    textInputType: TextInputType.number,
                                    onChanged: (value) {
                                      creditCardNumber = value;
                                    }),
                              ),
                              MyButton(
                                  onPress: () {
                                    ErrorType? errorType =
                                        validation(creditCardNumber);
                                    if (errorType != null) {
                                      showSnackbar(context,
                                          MyError(errorType: errorType).errorMessage());
                                    } else {
                                      Provider.of<CreditCardProvider>(context,
                                              listen: false)
                                          .addCard(CreditCard(
                                              name: "Fateme Afshar",
                                              cardNumber: creditCardNumber,
                                              dateExpire: "2/2024"));
                                      Navigator.pop(context);
                                    }
                                  },
                                  text: const Text("Add"))
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
              if (creditCards.isEmpty) {
                return Center(
                  child: Text(
                    "Add your card.",
                    style: buildTextStyle(
                        color: Color.fromARGB(255, 124, 156, 185),
                        fontSize: 24),
                  ),
                );
              }
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
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: buildTitle("Transactions"),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: Icon(
                  Icons.more_horiz,
                  color: Color.fromARGB(255, 124, 156, 185),
                ),
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

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  ErrorType? validation(String creditCardNumber) {
    if (!Validation.isEmptyInputs(creditCardNumber)) {
      if (Validation.isValidCardNumberChar(creditCardNumber)) {
        if (Validation.isValidCardNumberLength(creditCardNumber)) {
          return null;
        } else {
          return ErrorType.INVALID_CARD_LENGTH;
        }
      } else {
        return ErrorType.INVALID_INPUT;
      }
    } else {
      return ErrorType.EMPTY_INPUTS;
    }
  }


}
