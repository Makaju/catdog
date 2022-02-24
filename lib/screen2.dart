import 'package:flutter/material.dart';
import 'package:navigation_demo_starter/screen2.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}
class _Screen2State extends State<Screen2> {
  String dogimageurl = "";

  requestCat() async {
    //api url https://aws.random.cat/meow
    var result = await http.get('https://dog.ceo/api/breeds/image/random');
    var response = json.decode(result.body);
    // print(result.body);
    // print(response);
    // print(response["file"]);
    setState(() {
      dogimageurl = response["message"];
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
              dogimageurl != ""
                  ? Image(
                image: NetworkImage(
                  dogimageurl.toString(),
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
                  }
              ),
            ],
          ),
        ),
      ),
      // Center(
      // child: RaisedButton(
      // color: Colors.red,
      // child: Text('Go Forwards To Screen 2'),
      // onPressed: () {
      // Navigator.pushNamed(context, "second");
      //
      // },
      // ),
      // ),
    );
  }
}
