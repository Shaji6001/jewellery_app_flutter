import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  Future<dynamic> deleteData(String apiLink, id) async {
    return http.post(apiLink, body: id).then((http.Response response) {
      print(response.body.toString());
      var result = json.decode(response.body);

      return result;
    });
  }

  Future<dynamic> searchData(String apiLink, body) async {
    return http.post(apiLink, body: body).then((http.Response response) {
      print(response.body.toString());
      var result = json.decode(response.body);
      if (result.length == 0) {
        print("No Data found");
        name.text = "";
        phoneNo.text = "";
        price.text = "";
      } else {
        var getName = result[0]["shopName"];
        var getPhone = result[0]["customerPhoneno"];
        var getPrice = result[0]["goldPrice"];
        getId = result[0]["_id"].toString();

        setState(() {
          name.text = getName;
          phoneNo.text = getPhone;
          price.text = getPrice;
        });
      }
      return json.decode(response.body.toString());
    });
  }

  TextEditingController customerName = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  var getId = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Search View"),
        ),
        body: Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(10.0),
            child: Column(children: [
              TextField(
                controller: customerName,
                decoration: InputDecoration(
                    labelText: "Customer Name",
                    icon: Icon(Icons.contacts),
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 1))),
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                color: Colors.red,
                onPressed: () async {
                  var getCustname = customerName.text.toString();
                  var result = searchData(
                      "https://nodejsandmongodbjewelleryapp.herokuapp.com/search",
                      {"customerName": getCustname});
                  print(result);
                },
                child: TextButton.icon(
                    label: Text("Search"),
                    icon: Icon(
                      Icons.search,
                    )),
              ),
              TextField(
                controller: name,
                decoration: InputDecoration(
                    labelText: "Shop Name",
                    icon: Icon(Icons.shop),
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 1))),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: phoneNo,
                decoration: InputDecoration(
                    labelText: "Contact No.",
                    icon: Icon(Icons.shop),
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 1))),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: price,
                decoration: InputDecoration(
                    labelText: "Total Amount",
                    icon: Icon(Icons.shop),
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 1))),
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                  color: Colors.purpleAccent[100],
                  onPressed: () {
                    print(getId);

                    var result = deleteData(
                        "https://nodejsandmongodbjewelleryapp.herokuapp.com/sellgold",
                        {"id": getId});
                  },
                  child: TextButton.icon(
                      label: Text("Delete"),
                      icon: Icon(
                        Icons.delete_forever,
                      )))
            ])));
  }
}
