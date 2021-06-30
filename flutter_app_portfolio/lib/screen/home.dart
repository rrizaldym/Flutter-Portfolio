import 'package:flutter/material.dart';
import 'package:flutter_app_portfolio/screen/detail.dart';
import 'package:flutter_app_portfolio/screen/profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            leading: Image.asset(
              "assets/icons/icon(120x120).png",
              scale: 5,
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
            ],
            bottom:
                TabBar(indicatorColor: Colors.amber, indicatorWeight: 5, tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Top Anime List",
              ),
              Tab(
                icon: Icon(Icons.face),
                text: "Profile",
              ),
            ]),
          ),
          body: TabBarView(children: [
            home(),
            Details(),
            Profile(),
          ])),
    );
  }
}

TextEditingController searchController = TextEditingController();
Widget home() => Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text.rich(TextSpan(
              text: "Hai, Rizky }",
              style: TextStyle(
                fontSize: 16,
              ),
            )),
          ),
          SizedBox(
            height: 30,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Mau cari apa?",
                ),
              ),
            ),
          )
        ],
      ),
    );
