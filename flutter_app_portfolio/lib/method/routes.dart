import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_portfolio/screen/home.dart';
import 'package:flutter_app_portfolio/screen/login.dart';
import 'package:flutter_app_portfolio/screen/profile.dart';
import 'package:flutter_app_portfolio/screen/register.dart';
import 'package:flutter_app_portfolio/screen/splash.dart';
import 'package:flutter_app_portfolio/screen/topList.dart';
import 'package:flutter_app_portfolio/screen/welcome.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Splash());
      // case '/detailsTopAnime':
      //   return MaterialPageRoute(builder: (_) => Details(malId: 38524));
      // case '/detailsTopManga':
      //   return MaterialPageRoute(builder: (_) => Details());
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
      case '/profile':
        return MaterialPageRoute(builder: (_) => Profile());
      case '/register':
        return MaterialPageRoute(builder: (_) => Register());
      case '/topList':
        return MaterialPageRoute(builder: (_) => TopList());
      case '/welcome':
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
