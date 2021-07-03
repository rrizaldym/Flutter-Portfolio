import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class MangaNews extends StatefulWidget {
  const MangaNews({Key? key}) : super(key: key);

  @override
  _MangaNewsState createState() => _MangaNewsState();
}

class _MangaNewsState extends State<MangaNews> {
  final String url = "https://api.jikan.moe/v3/manga/1/news";
  List? data;

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  Future<String?> getData() async {
    var respone =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    setState(() {
      var convertData = jsonDecode(respone.body);
      data = convertData['articles'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data == null ? 0 : data!.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                margin: EdgeInsets.all(10),
                width: 200,
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
                          text: data![index]["intro"], style: TextStyle())),
                    ),
                  ],
                ));
          }),
    );
  }
}
