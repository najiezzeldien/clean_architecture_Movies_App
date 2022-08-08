import 'package:flutter/material.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/core/utils/app_string.dart';
import 'package:movies_app/movies/presentaion/screens/movies_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      theme: ThemeData.dark().copyWith(
        backgroundColor: Colors.grey.shade900,
      ),
      home: const MoviesScreen(),
    );
  }
}
