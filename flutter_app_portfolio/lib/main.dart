import 'package:flutter/material.dart';
import 'package:flutter_app_portfolio/method/routes.dart';

void main() {
  runApp(MaterialApp(
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}
