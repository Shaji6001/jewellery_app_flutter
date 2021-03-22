import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_jewellery_app_nodejs/screens/My_drawer.dart';

void main() => runApp(MyJewelleryApp());

class MyJewelleryApp extends StatefulWidget {
  @override
  _MyJewelleryAppState createState() => _MyJewelleryAppState();
}

class _MyJewelleryAppState extends State<MyJewelleryApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[100],
          title: Text(
            "Jewellery Shop",
            style: TextStyle(
                fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FlatButton(
                color: Colors.amberAccent,
                onPressed: () {},
                child: Text("LOGIN"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
