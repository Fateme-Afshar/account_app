import 'package:account_app/widgets/credit_card_widget.dart';
import 'package:account_app/widgets/transaction_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {},
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
              child: CarouselSlider(
            options: CarouselOptions(
                height: 200.0, enlargeCenterPage: true, aspectRatio: 2.0),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return CreditCardWidget();
                },
              );
            }).toList(),
          )),
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return TransactionWidget();
          }))
        ],
      ),
    );
  }
}
