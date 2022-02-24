import 'package:flutter/material.dart';
import 'package:navigation_demo_starter/screen1.dart';
import 'package:navigation_demo_starter/screen2.dart';
class Screen0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('What Do you want to see? Cat Or a Dog'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              color: Colors.teal,
              child: Text('Go To Cat Page', style: TextStyle(fontSize: 25,
                fontWeight: FontWeight.bold,),),
              onPressed: () {
                Navigator.pushNamed(context, "first");
              },
            ),
            RaisedButton(
              color: Colors.cyan,
              child: Text('Go To Dog Page', style: TextStyle(fontSize: 25,
                fontWeight: FontWeight.bold,),),
              onPressed: () {
                Navigator.pushNamed(context, "second");
              },
            ),
          ],
        ),
      ),
    );
  }
}

