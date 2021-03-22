import 'package:flutter/material.dart';
import 'package:flutter_jewellery_app_nodejs/screens/My_drawer.dart';
import 'package:flutter_jewellery_app_nodejs/screens/Search_view.dart';
import 'package:flutter_jewellery_app_nodejs/screens/Update_view.dart';
import 'package:flutter_jewellery_app_nodejs/screens/View_report.dart';

class MyTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            backgroundColor: Colors.deepPurple[300],
            title: Text("Messages"),
            bottom: TabBar(
              tabs: [
                Tab(text: "View Report"),
                Tab(text: "My Updates"),
                Tab(text: "Search View"),
              ],
            ),
          ),
          drawer: MyDrawer(),
          body: TabBarView(
            children: [ViewReport(), MyUpdateView(), SearchView()],
          ),
        ),
      ),
    );
  }
}
