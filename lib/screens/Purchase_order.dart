import 'package:flutter/material.dart';
import 'package:flutter_jewellery_app_nodejs/model/jewellery_model.dart';
import 'package:flutter_jewellery_app_nodejs/screens/Tab_view.dart';
//import 'package:flutter_jewellery_app_nodejs/screens/View_report.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<JewelleryModel> sendData(String apiLink, {Map body}) async {
  return http.post(apiLink, body: body).then((http.Response response) {
    print(response.body.toString());
    return json.decode(response.body.toString());
  });
}

class PurchaseOrder extends StatefulWidget {
  @override
  _PurchaseOrderState createState() => _PurchaseOrderState();
}

class _PurchaseOrderState extends State<PurchaseOrder> {
  TextEditingController name = TextEditingController();
  TextEditingController customer = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController rate = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Purchase Order"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                  labelText: "Shop Name",
                  icon: Icon(Icons.shop),
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
            ),
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
            TextField(
              controller: phone,
              decoration: InputDecoration(
                  labelText: "Customer Phone No",
                  icon: Icon(Icons.contact_phone),
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: rate,
              decoration: InputDecoration(
                  labelText: "Gold Rate",
                  icon: Icon(Icons.rate_review_rounded),
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: weight,
              decoration: InputDecoration(
                  labelText: "Gold Weight",
                  icon: Icon(Icons.line_weight),
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: amount,
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
                var getName = name.text;
                var getCustomer = customer.text;
                var getPhone = phone.text;
                var getRate = rate.text;
                var getWeight = weight.text;
                var getAmount = amount.text;
                JewelleryModel golddata = new JewelleryModel(
                  shopName: getName,
                  customerName: getCustomer,
                  customerPhoneno: getPhone,
                  goldRate: getRate,
                  goldWeight: getWeight,
                  goldPrice: getAmount,
                );
                JewelleryModel datatosend = await sendData(
                    "https://nodejsandmongodbjewelleryapp.herokuapp.com/buygold",
                    body: golddata.toJson());
              },
              child: Text("Save"),
            ),
            FlatButton(
              color: Colors.lightGreenAccent,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyTabView()));
              },
              child: Text("View"),
            )
          ],
        ),
      ),
    );
  }
}
