import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'AnimeNews.dart';
import 'mangaNews.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text.rich(TextSpan(
                text: "Hai, ",
                style: TextStyle(
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: "\n${auth.currentUser!.email}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ])),
          ),
          // SizedBox(
          //   height: 30,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 15),
          //     child: TextField(
          //       controller: searchController,
          //       decoration: InputDecoration(
          //         border: OutlineInputBorder(),
          //         labelText: "Mau cari apa?",
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(height: 20, child: Text("Anime News Today")),
          ),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/newsAnime');
              },
              child: GetAPI()),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(height: 20, child: Text("Manga News Today")),
          ),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/newsManga');
              },
              child: MangaNews()),
        ],
      ),
    ]);
  }
}
