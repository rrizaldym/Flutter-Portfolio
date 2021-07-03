import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final String? url2 = "https://api.jikan.moe/v3/anime/5114";
  dynamic data;

  void initState() {
    super.initState();
    this.getData();
  }

  Future<String?> getData() async {
    var response = await http
        .get(Uri.parse(url2!), headers: {"Accept": "application/json"});
    print(response.body);
    setState(() {
      var convertData = jsonDecode(response.body);
      data = convertData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
      appBar: AppBar(
        title: Text(data!["title"]),
      ),
      body: ListView(children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.all(5.0),
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: Image.network(
                    data!["image_url"],
                  )),
                  Container(
                      // height: 300,
                      width: 200,
                      padding: EdgeInsets.only(left: 5),
                      // color: Colors.blue,
                      child: ListView(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Title : ${data!["title"]}"),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                                "Rank : ${data!["rank"]}, Score : ${data!["score"]}"),
                            SizedBox(
                              height: 3,
                            ),
                            Text("Type : ${data!["type"]}"),
                            SizedBox(
                              height: 3,
                            ),
                            Text("Premiered : ${data!["premiered"]}"),
                            SizedBox(
                              height: 3,
                            ),
                            Text.rich(TextSpan(text: "Studios :", children: [
                              if (data!['studios'].length > 1)
                                for (var genres = 0;
                                    genres < data!['studios'].length - 1;
                                    genres++)
                                  TextSpan(
                                      text:
                                          " ${data!['studios'][genres]['name']},"),
                              TextSpan(
                                  text:
                                      " ${data!['studios'][data!['studios'].length - 1]['name']}"),
                              if (data!['studios'].length < 1)
                                TextSpan(
                                    text:
                                        " ${data!['studios'][data!['studios'].length - 1]['name']}"),
                            ])),
                            SizedBox(
                              height: 3,
                            ),
                            Text("Rating : ${data!["rating"]}"),
                            SizedBox(
                              height: 3,
                            ),
                            Text.rich(TextSpan(text: "Genres :", children: [
                              if (data!['genres'].length > 1)
                                for (var genres = 0;
                                    genres < data!['genres'].length - 1;
                                    genres++)
                                  TextSpan(
                                      text:
                                          " ${data!['genres'][genres]['name']},"),
                              TextSpan(
                                  text:
                                      " ${data!['genres'][data!['genres'].length - 1]['name']}"),
                              if (data!['genres'].length < 1)
                                TextSpan(
                                    text:
                                        " ${data!['genres'][data!['genres'].length - 1]['name']}"),
                            ])),
                          ],
                        ),
                      ])),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              color: Colors.green,
              height: 100,
              // child: video,
            )
          ],
        ),
      ]),
    ));
  }
}
