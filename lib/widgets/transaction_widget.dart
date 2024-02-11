import 'package:account_app/model/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_widget_build_methods.dart';

class TransactionWidget extends StatelessWidget {
  final Transaction transaction;

  const TransactionWidget({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20), // Add padding for better spacing
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 16,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              Icons.card_travel,
              color: Color.fromARGB(255, 124, 156, 185),
              size: 30,
            ),
          ),
          SizedBox(width: 8.0), // Add some space between icon and text
          Expanded(
            // Wrap Column in Expanded to constrain its width
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // Align text to the start
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                            child: buildSingleLineText(
                                "${transaction.title}",
                                buildTextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold)))),
                    // Wrap in Expanded
                    buildAmountText((transaction.isIncrease == null
                        ? false
                        : transaction.isIncrease!))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                      child: buildSingleLineText(
                          "${transaction.content}",
                          buildTextStyle(
                              fontSize: 14,
                              color: const Color.fromARGB(255, 124, 156, 185))),
                    )),
                    Text("${transaction.date}",
                        style: buildTextStyle(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 124, 156, 185),
                            fontStyle: FontStyle.italic)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text buildAmountText(bool isIncrease) {
    return Text("${isIncrease ? '+' : "-"} \$${transaction.amount}",
        style: buildAmountBuildTextStyle(transaction.isIncrease!));
  }

  TextStyle buildAmountBuildTextStyle(bool isIncrease) => buildTextStyle(
      fontSize: 18, color: isIncrease ? Colors.green : Colors.red);
}
