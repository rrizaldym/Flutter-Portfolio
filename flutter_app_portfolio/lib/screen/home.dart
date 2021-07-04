import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_portfolio/screen/topList.dart';
import 'package:flutter_app_portfolio/screen/profile.dart';
import 'package:flutter_app_portfolio/widget/homeWidget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 120,
            leading: Image.asset(
              "assets/icons/icon(120x120).png",
              scale: 5,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    _signOut().then((value) =>
                        Navigator.pushReplacementNamed(context, '/login'));
                  },
                  icon: Icon(Icons.logout)),
            ],
            bottom: TabBar(indicatorColor: Colors.amber, indicatorWeight: 5,
                // automaticIndicatorColorAdjustment: true,
                // labelPadding: EdgeInsets.all(1),
                // unselectedLabelColor: Colors.red,
                // unselectedLabelStyle: tex,
                tabs: [
                  Tab(
                    icon: Icon(Icons.home),
                    text: "Home",
                  ),
                  Tab(
                    icon: Icon(Icons.star),
                    text: "Top List",
                  ),
                  Tab(
                    icon: Icon(Icons.face),
                    text: "Profile",
                  ),
                ]),
          ),
          body: TabBarView(children: [
            HomeWidget(),
            TopList(),
            Profile(),
          ])),
    );
  }
}
