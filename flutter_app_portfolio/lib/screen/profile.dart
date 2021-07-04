import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_portfolio/model/userPreferences.dart';
import 'package:flutter_app_portfolio/widget/textFieldWidget.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = UserPreferences.myUser;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return ListView(
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
                    image: AssetImage('assets/images/IMG-20201223-WA0108.jpg'),
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
              user.name,
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
        TextFieldWidget(
            label: 'Full Name',
            text: user.name,
            onChanged: (name) {
              // user.name.replaceAll(name, user.name);
              print(name);
            }),
        SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            child: Text('changed name'),
            style: ElevatedButton.styleFrom(
              onPrimary: Colors.white,
              shape: StadiumBorder(),
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
          ),
        ),
      ],
    );
  }
}
