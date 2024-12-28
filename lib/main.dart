import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skills_53_regional_flutter/components/drawer.dart';
import 'package:skills_53_regional_flutter/screens/home.dart';
import 'package:skills_53_regional_flutter/screens/news.dart';
import 'package:skills_53_regional_flutter/screens/splash.dart';

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
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/': (context) => const HomeScreen(),
        '/news': (context) => const NewsScreen(),
        'drawer': (context) => const AppDrawer(),
      },
    );
  }
}
