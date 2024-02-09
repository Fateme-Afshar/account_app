import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreditCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue, // Start color
            Colors.green, // End color
          ],
        ),
      ),
      child: const Column(
        children: [
          Row(
            children: [
              Image(
                image: AssetImage('assets/bank_account.png'),
                width: 24,
                height: 24,
              ),
              Spacer(),
              Icon(Icons.more_horiz)
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "6037 9975 8798 1243",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Text(textAlign: TextAlign.center,"Card holder \n Fateme Afshar"),
              Spacer(),
              Text(textAlign: TextAlign.center,"Expity \n 2/2024"),
            ],
          )
        ],
      ),
    );
  }
}
