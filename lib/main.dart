import 'package:disney_time_keeper/config/router/routes.dart';
import 'package:disney_time_keeper/pages/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Home(),
          onGenerateRoute: Routes.generateRoute,
        );
  }
}
