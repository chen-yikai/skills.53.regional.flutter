import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/drawer.dart';
import 'screens/home.dart';
import 'screens/news.dart';
import 'screens/splash.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        'splash': (context) => const SplashScreen(),
        'home': (context) => const HomeScreen(),
        'news': (context) => const NewsScreen(),
        'drawer': (context) => const AppDrawer(),
      },
    );
  }
}

enum Nav {
  home,
  news,
  splash,
}
