import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.menu),
        Column(
          children: [
            Row(
              children: [Text("Sony PlayStation"), Spacer(), Text("-\$5020")],
            ),
            Row(
              children: [
                Text("FiFa 2020 Game"),
                Spacer(),
                Text("14 July,2024")
              ],
            ),
          ],
        )
      ],
    );
  }
}
