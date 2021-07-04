import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_portfolio/method/counters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _changed = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<CounterBloc>(context);

    return BlocBuilder<CounterBloc, String>(
      builder: (context, state) => ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 32),
        children: [
          Container(
              // height: 150,
              margin: EdgeInsets.all(10),
              // color: Colors.red,
              child: Center(
                  child: Stack(children: [
                ClipOval(
                  child: Material(
                    color: Colors.transparent,
                    child: Ink.image(
                      image:
                          AssetImage('assets/images/IMG-20201223-WA0108.jpg'),
                      fit: BoxFit.cover,
                      width: 128,
                      height: 128,
                      child: InkWell(
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 4,
                    child: ClipOval(
                      child: Container(
                        padding: EdgeInsets.all(3),
                        color: Colors.white,
                        child: ClipOval(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            color: Colors.blue,
                            child: Icon(
                              Icons.edit,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )),
              ]))),
          SizedBox(height: 20),
          Container(
            // height: 150,
            // color: Colors.blue,
            child: Column(children: [
              Text(
                state,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '${auth.currentUser!.email}',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ]),
          ),
          SizedBox(height: 150),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Full Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                controller: _changed,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                bloc.add(_changed.text);
              },
              child: Text('changed name'),
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
