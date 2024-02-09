import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(8.0), // Add padding for better spacing
      child: const Row(
        children: [
          Padding(padding: EdgeInsets.fromLTRB(4, 0, 4, 0),child: Icon(Icons.card_travel),),
          SizedBox(width: 8.0), // Add some space between icon and text
          Expanded( // Wrap Column in Expanded to constrain its width
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
              children: [
                Row(
                  children: [
                    Expanded(child: Text("Sony PlayStation")), // Wrap in Expanded
                    Text("-\$5020"),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: Text("FiFa 2020 Game")), // Wrap in Expanded
                    Text("14 July, 2024"),
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
