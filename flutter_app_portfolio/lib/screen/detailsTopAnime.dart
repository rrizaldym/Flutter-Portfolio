import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Details extends StatefulWidget {
  const Details({Key? key, required this.malId}) : super(key: key);
  final int malId;
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  dynamic data;

  void initState() {
    super.initState();
    this.getData();
  }

  Future<String?> getData() async {
    final String? url2 = "https://api.jikan.moe/v3/anime/${widget.malId}";
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 40,
        leading: BackButton(
          color: Colors.black,
        ),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text.rich(TextSpan(
                      text: 'Theme Songs', style: TextStyle(fontSize: 20))),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 150,
                    // color: Colors.blue,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 150,
                            // color: Colors.blue,
                            child: ListView(children: [
                              Text.rich(TextSpan(
                                  text: "Opening Themes :\n",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                  children: [
                                    for (var text in data!['opening_themes'])
                                      TextSpan(
                                          text: "${text}\n",
                                          style: TextStyle(
                                            fontSize: 12,
                                          )),
                                  ]))
                            ]),
                          ),
                          Container(
                            width: 150,
                            // color: Colors.red,
                            child: ListView(children: [
                              Text.rich(TextSpan(
                                  text: "Ending Themes :\n",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                  children: [
                                    for (var text in data!['ending_themes'])
                                      TextSpan(
                                          text: "${text}\n",
                                          style: TextStyle(
                                            fontSize: 12,
                                          )),
                                  ]))
                            ]),
                          ),
                        ]),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              // color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Synopsis',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(data!['synopsis']),
                ],
              ),
            )
          ],
        ),
      ]),
    ));
  }
}
