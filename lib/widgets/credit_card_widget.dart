import 'package:account_app/model/creditCard.dart';
import 'package:account_app/widgets/custom_widget_build_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreditCardWidget extends StatelessWidget {
  final CreditCard creditCard;

  const CreditCardWidget({super.key, required this.creditCard});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue, // Start color
            Colors.green, // End color
          ],
        ),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Image(
                image: AssetImage('assets/bank_account.png'),
                width: 24,
                height: 24,
              ),
              Spacer(),
              Icon(
                Icons.more_horiz,
                color: Colors.white,
              )
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                butifierCardNumber(creditCard.cardNumber!),
                textAlign: TextAlign.center,
                style: buildTextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Row(
            children: [
              Text(
                textAlign: TextAlign.center,
                "Card holder \n ${creditCard.name}",
                style: buildTextStyle(color: Colors.white),
              ),
              Spacer(),
              Text(
                  textAlign: TextAlign.center,
                  "Expity \n ${creditCard.dateExpire}",
                  style: buildTextStyle(color: Colors.white)),
            ],
          )
        ],
      ),
    );
  }

  String butifierCardNumber(String cardNumber) {
    if (cardNumber.isNotEmpty) {
      return cardNumber.replaceAllMapped(
          RegExp(r'.{1,4}'), (Match match) => "${match.group(0)} ");
    }
    return "";
  }
}
