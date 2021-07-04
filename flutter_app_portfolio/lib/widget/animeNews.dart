import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetAPI extends StatefulWidget {
  const GetAPI({Key? key}) : super(key: key);

  @override
  _GetAPIState createState() => _GetAPIState();
}

class _GetAPIState extends State<GetAPI> {
  final String? url = "https://api.jikan.moe/v3/anime/1/news";
  List? data;

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  Future<String?> getData() async {
    var response = await http
        .get(Uri.parse(url!), headers: {"Accept": "application/json"});
    setState(() {
      var convertData = jsonDecode(response.body);
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
          // itemCount: data == null ? 0 : 7,
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
                          text: data![index]["intro"],
                          // text: data![index]["title"],
                          style: TextStyle())),
                    ),
                  ],
                ));
          }),
    );
  }
}
