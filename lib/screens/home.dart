import 'package:flutter/material.dart';
import 'package:skills_53_regional_flutter/components/drawer.dart';
import '../components/home_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const AppDrawer(),
      body: Stack(children: [
        Expanded(child: Image.asset('assets/bg.png')),
        SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: IconButton(
                    onPressed: () {
                      print('Drawer');
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    icon: Image.asset('assets/icons/menu.png', height: 40)))),
        Padding(
          padding: const EdgeInsets.all(60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/home_logo.png', height: 100),
              const SizedBox(height: 100),
              Column(children: [
                HomeButton(text: '最新消息', icon: 'home.png', onPressed: () {}),
                HomeButton(text: '關於競賽', icon: 'people.png', onPressed: () {}),
                HomeButton(text: '職類介紹', icon: 'cup.png', onPressed: () {}),
              ]),
            ],
          ),
        ),
      ]),
    );
  }
}
