import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_portfolio/widget/getTopListAnime.dart';
import 'package:flutter_app_portfolio/widget/getTopListManga.dart';

class TopList extends StatefulWidget {
  const TopList({Key? key}) : super(key: key);

  @override
  _TopListState createState() => _TopListState();
}

class _TopListState extends State<TopList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(height: 20, child: Text("Top Anime")),
        ),
        GetTopAnimeList(),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(height: 20, child: Text("Top Manga")),
        ),
        GetTopListManga(),
      ],
    ));
  }
}
