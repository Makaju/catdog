import 'package:flutter/material.dart';
import 'package:navigation_demo_starter/screen2.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}
class _Screen1State extends State<Screen1> {
  String catimageurl = "";
  requestCat() async {
    //api url https://aws.random.cat/meow
    var result = await http.get('https://aws.random.cat/meow');
    var response = json.decode(result.body);
    setState(() {
      catimageurl = response["file"];
    });
  }
  @override
  void initState() {
    requestCat();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          requestCat();
        },
        child: Icon(Icons.refresh),
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Cats Only'),
      ),
      body: Center(
        child: SizedBox(
          height: 400,
          width: 300,
          child: Column(
            children: [
              Text(
                'Mew Mew Biralo Yeta tira Aau',
                style: TextStyle(fontSize: 22.0),
              ),
              SizedBox(
                height: 20,
              ),
              catimageurl != ""
                  ? Image(
                image: NetworkImage(
                  catimageurl.toString(),
                ),
                height: 200,
                width: 250,
              )
                  : Text('Loading....'),
              SizedBox(
                height: 10,
              ),
              Text(
                'Mew Mew Biralo Yeta tira Aau',
                style: TextStyle(fontSize: 22.0),
              ),
              RaisedButton(
                color: Colors.cyan,
                child: Text('Home', style: TextStyle(fontSize: 25, fontWeight:
                FontWeight.bold,),),
                onPressed: () {
                  Navigator.pushNamed(context, "init");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

