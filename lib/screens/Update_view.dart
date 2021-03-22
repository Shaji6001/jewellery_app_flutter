import 'package:flutter/material.dart';
import 'package:flutter_jewellery_app_nodejs/model/jewellery_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class MyUpdateView extends StatefulWidget {
  @override
  _MyUpdateViewState createState() => _MyUpdateViewState();
}

class _MyUpdateViewState extends State<MyUpdateView> {
  Future<dynamic> updateData(String apiLink, {Map body}) async {
    return http.post(apiLink, body: body).then((http.Response response) {
      print(response.body.toString());
      return json.decode(response.body.toString());
    });
  }

  Future<dynamic> searchData(String apiLink, body) async {
    return http.post(apiLink, body: body).then((http.Response response) {
      print(response.body.toString());
      var result = json.decode(response.body.toString());
      if (result.length == 0) {
        print("Invalid Data");
      } else {
        getcustomerName = result[0]["shopName"];
        getcustomerPhoneno = result[0]["customerPhoneno"].toString();
        getshopName = result[0]["shopName"];
        getgoldAmount = result[0]["goldPrice"].toString();
        getgoldRate = result[0]["goldRate"].toString();
        getgoldWeight = result[0]["goldPrice"].toString();
        getId = result[0]["_id"].toString();
        getcustomer = result[0]["shopName"];
        getphone = result[0]["customerPhoneno"].toString();

        setState(() {
          name.text = getshopName;
          customer.text = getcustomer;
          phoneNo.text = getcustomerPhoneno;
          newPhone.text = getcustomerPhoneno;
          newCustomer.text = getcustomerName;
          newName.text = getcustomer;
          newRate.text = getgoldRate;
          newAmount.text = getgoldAmount;
          newWeight.text = getgoldWeight;
        });
      }
    });
  }

  TextEditingController customer = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController newCustomer = TextEditingController();
  TextEditingController newName = TextEditingController();
  TextEditingController newPhone = TextEditingController();
  TextEditingController newRate = TextEditingController();
  TextEditingController newWeight = TextEditingController();
  TextEditingController newAmount = TextEditingController();
  var getId = "";
  var getcustomerName = "";
  var getcustomerPhoneno = "";
  var getshopName = "";
  var getgoldAmount = "";
  var getgoldRate = "";
  var getgoldWeight = "";
  var getcustomer = "";
  var getphone = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Update Page"),
      ),
      body: Container(
        color: Colors.grey[100],
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: customer,
              decoration: InputDecoration(
                  labelText: "Customer Name",
                  icon: Icon(Icons.contacts),
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              color: Colors.greenAccent,
              onPressed: () async {
                var getCustname = customer.text.toString();
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
              controller: newCustomer,
              decoration: InputDecoration(
                  labelText: "Customer Name",
                  icon: Icon(Icons.contact_phone),
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: newName,
              decoration: InputDecoration(
                  labelText: "Shop Name",
                  icon: Icon(Icons.shop),
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: newPhone,
              decoration: InputDecoration(
                  labelText: "Phone No.",
                  icon: Icon(Icons.shop),
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: newRate,
              decoration: InputDecoration(
                  labelText: "Gold Rate",
                  icon: Icon(Icons.rate_review_rounded),
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: newWeight,
              decoration: InputDecoration(
                  labelText: "Gold Weight",
                  icon: Icon(Icons.line_weight),
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: newAmount,
              decoration: InputDecoration(
                  labelText: "Total Amount",
                  icon: Icon(Icons.attach_money),
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              color: Colors.deepPurple,
              onPressed: () async {
                var getnewName = name.text;
                var getnewCustomer = customer.text;
                var getnewPhone = phoneNo.text;
                var getnewRate = newRate.text;
                var getnewWeight = newWeight.text;
                var getnewAmount = newAmount.text;

                JewelleryModel golddata = new JewelleryModel(
                  id: getId,
                  shopName: getshopName,
                  customerName: getcustomerName,
                  customerPhoneno: getcustomerPhoneno,
                  goldRate: getgoldRate,
                  goldWeight: getgoldWeight,
                  goldPrice: getgoldAmount,
                );
                JewelleryModel datatosend = await updateData(
                    "https://nodejsandmongodbjewelleryapp.herokuapp.com/update",
                    body: golddata.toJson());
              },
              child: Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}
