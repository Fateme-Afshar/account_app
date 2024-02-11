import 'package:account_app/model/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionWidget extends StatelessWidget {
  final Transaction transaction;

  const TransactionWidget({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0), // Add padding for better spacing
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
            child: Icon(Icons.card_travel),
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
                    Expanded(child: Text("${transaction.title}")),
                    // Wrap in Expanded
                    (transaction.isIncrease == null
                            ? false
                            : transaction.isIncrease!)
                        ? Text("-${transaction.amount}")
                        : Text("${transaction.amount}"),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: Text("${transaction.content}")), // Wrap in Expanded
                    Text("${transaction.date}"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
