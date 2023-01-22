import 'package:flutter/material.dart';
import 'package:ipotato_timer/core/di/inject.dart';
import 'package:ipotato_timer/presentation/ui/pages/home_page.dart';

void main() async {
  await Inject.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
