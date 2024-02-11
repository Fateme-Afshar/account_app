import 'package:account_app/model/creditCard.dart';
import 'package:account_app/presenter/provider/credit_card_provider.dart';
import 'package:account_app/widgets/credit_card_widget.dart';
import 'package:account_app/widgets/custom_input.dart';
import 'package:account_app/widgets/transaction_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late String creditCardNumber;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Credit Cards'),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: const CircleAvatar(
              child: Image(image: AssetImage('assets/profile.png')),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  "Cards",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
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
                                      SnackBar(
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
                                child: Text("Add"),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    textStyle: TextStyle(fontSize: 18),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Row(
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
          Expanded(
              child: Consumer<CreditCardProvider>(
                builder: (context,creditCardProvider,child){
                  final creditCards=creditCardProvider.cards;

                  return CarouselSlider(
                    options: CarouselOptions(height: 200.0, enlargeCenterPage: true),
                    items: creditCards.map((card) {
                      return Builder(
                        builder: (BuildContext context) {
                          return CreditCardWidget(creditCard: card,);
                        },
                      );
                    }).toList(),
                  );
                },
              )),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Text(
                  "Transactions",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                child: Icon(Icons.more_horiz),
              ),
            ],
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return TransactionWidget();
                  }))
        ],
      ),
    );
  }
}
