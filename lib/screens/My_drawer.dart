import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_jewellery_app_nodejs/screens/Purchase_order.dart';
import 'package:flutter_jewellery_app_nodejs/screens/Search_view.dart';
import 'package:flutter_jewellery_app_nodejs/screens/Update_view.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("User Name"),
            accountEmail: Text("user@gmail.com"),
            currentAccountPicture: CircleAvatar(),
          ),
          Card(
            elevation: 8,
            child: ListTile(
              title: Text(
                "New User",
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
              tileColor: Colors.blueGrey[200],
              trailing: Icon(Icons.forward),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PurchaseOrder()));
              },
            ),
          ),
          ListTile(
            title: Text(
              "User Search",
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
            tileColor: Colors.blueGrey[300],
            trailing: Icon(Icons.forward),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchView()));
            },
          ),
          ListTile(
            title: Text(
              "User Update",
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
            tileColor: Colors.blueGrey[50],
            trailing: Icon(Icons.forward),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyUpdateView()));
            },
          )
        ],
      ),
    );
  }
}
