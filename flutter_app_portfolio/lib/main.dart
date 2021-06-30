import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_portfolio/method/counter.dart';
import 'package:flutter_app_portfolio/method/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BlocProvider(create: (context) => CounterBloc(),
    child: MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    ),
  ));
}
