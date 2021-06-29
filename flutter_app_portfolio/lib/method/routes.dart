import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_portfolio/screen/detail.dart';
import 'package:flutter_app_portfolio/screen/home.dart';
import 'package:flutter_app_portfolio/screen/login.dart';
import 'package:flutter_app_portfolio/screen/profile.dart';
import 'package:flutter_app_portfolio/screen/register.dart';
import 'package:flutter_app_portfolio/screen/splash.dart';
import 'package:flutter_app_portfolio/screen/welcome.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Splash());
      case '/home':
        return MaterialPageRoute(builder: (_) => Details());
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
      case '/home':
        return MaterialPageRoute(builder: (_) => Login());
      case '/home':
        return MaterialPageRoute(builder: (_) => Profile());
      case '/home':
        return MaterialPageRoute(builder: (_) => Register());
      case '/home':
        return MaterialPageRoute(builder: (_) => Welcome());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: Center(
          child: Text('Error Page'),
        ),
      );
    });
  }
}