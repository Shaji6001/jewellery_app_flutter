import 'package:flutter/material.dart';
//import 'package:flutter_jewellery_app_nodejs/model/jewellery_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class ViewReport extends StatefulWidget {
  @override
  _ViewReportState createState() => _ViewReportState();
}

class _ViewReportState extends State<ViewReport> {
  Future<dynamic> getData(apiLink) async {
    return http.get(apiLink).then((http.Response response) {
      print(response.body.toString());
      JewelleryModel = json.decode(response.body.toString());
      return json.decode(response.body.toString());
    });
  }

  @override
  void initState() {
    getData("https://nodejsandmongodbjewelleryapp.herokuapp.com/viewall");
  }

  List JewelleryModel = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Report"),
      ),
      body: Container(
          child: ListView.builder(
        shrinkWrap: true,
        itemCount: JewelleryModel.length == null ? 0 : JewelleryModel.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: ListTile(
              title: Text(
                  "Shop Name:" + JewelleryModel[index]["shopName"].toString()),
              subtitle: Text("Customer:" +
                  JewelleryModel[index]["customerName"].toString() +
                  '\n' +
                  "Amount:" +
                  JewelleryModel[index]["goldPrice"]),
            ),
          );
        },
      )),
    );
  }
}
