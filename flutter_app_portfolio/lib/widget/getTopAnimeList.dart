import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_portfolio/screen/detailsTopAnime.dart';
import 'package:http/http.dart' as http;

class GetTopAnimeList extends StatefulWidget {
  const GetTopAnimeList({Key? key}) : super(key: key);

  @override
  _GetTopAnimeListState createState() => _GetTopAnimeListState();
}

class _GetTopAnimeListState extends State<GetTopAnimeList> {
  final String? url2 = "https://api.jikan.moe/v3/top/anime/1/";
  List? data;

  void initState() {
    super.initState();
    this.getData();
  }

  Future<String?> getData() async {
    var response = await http
        .get(Uri.parse(url2!), headers: {"Accept": "application/json"});
    // print(response.body);
    setState(() {
      var convertData = jsonDecode(response.body);
      data = convertData['top'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      // color: Colors.red,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data == null ? 0 : data!.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Route route = MaterialPageRoute(
                    builder: (context) =>
                        Details(malId: data![index]['mal_id']));
                Navigator.push(context, route);
              },
              child: Container(
                  margin: EdgeInsets.all(10),
                  width: 175,
                  // color: Colors.blue,
                  child: ListView(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 250,
                        // width: 200,
                        child: Image.network(
                          data![index]["image_url"],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text.rich(TextSpan(
                            text: data![index]["title"],
                            children: [
                              // TextSpan(text: '\n${data![index]['mal_id']}')
                            ],
                            style: TextStyle())),
                      ),
                    ],
                  )),
            );
          }),
    );
  }
}
