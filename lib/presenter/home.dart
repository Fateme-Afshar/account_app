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
          Container(
            margin: EdgeInsets.only(right: 12),
            child: const CircleAvatar(
              child: Image(image: AssetImage('assets/profile.png')),
            ),
          ),
        ],
      ),
      body: Text("cards"),
    );
  }
}
