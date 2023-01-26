import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get_it/get_it.dart';
import 'package:ipotato_timer/core/di/inject.dart';
import 'package:ipotato_timer/presentation/states/home_state.dart';
import 'package:ipotato_timer/presentation/theme/app_theme.dart';
import 'package:ipotato_timer/presentation/ui/pages/home_page.dart';

void main() async {
  await Inject.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iPotato Timer',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(
        homeState: GetIt.I.get<HomeState>(),
      ),
    );
  }
}
