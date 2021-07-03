import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // toolbarHeight: 40,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(
                text: "Register",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ))),
            SizedBox(
              height: 5.0,
            ),
            Text.rich(TextSpan(
                text: "Please fill in a few details below",
                style: TextStyle(
                  fontSize: 14,
                ))),
            SizedBox(
              height: 30,
            ),
            Container(
                padding: EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.name,
                      controller: _name,
                      decoration: InputDecoration(
                          // hintText: "@gmail.com",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: "Name"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _email,
                      decoration: InputDecoration(
                          hintText: "@domain.com",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: "Email"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _password,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: "Password"),
                    ),
                  ],
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard_arrow_right, color: Colors.white),
        backgroundColor: Color(0xffFA3147),
        onPressed: () async {
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: _email.text, password: _password.text);
          // print(_email.text);
          // print(_password.text);
          Navigator.pushReplacementNamed(context, '/home');
        },
      ),
    );
  }
}
