import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: Image.asset("assets/icons/icon(120x120).png"),
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 20,
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/icons/icon(120x120).png",
                    scale: 3,
                  ),
                ],
              ),
              SizedBox(height: 525),
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Color(0xffFC5B1B),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Color(0xFFCA3E74),
                    padding: EdgeInsets.symmetric(horizontal: 37),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ],
              )),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text.rich(TextSpan(
                    text: "By logging in or registering, you agree to our ",
                    children: [
                      TextSpan(
                          text: "Terms of Service ",
                          style: TextStyle(
                            color: Colors.blue,
                          )),
                      TextSpan(text: "and "),
                      TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(color: Colors.blue)),
                      TextSpan(text: "."),
                    ])),
              )
            ],
          ),
        ));
  }
}
