import 'package:flutter/material.dart';
import 'package:skills_53_regional_flutter/components/list_button.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              child: Image.asset('assets/nav_logo.png', height: 60),
            ),
          ),
          const SizedBox(height: 50),
          const ListButton(
              title: "最新消息", icon: "home", current: false, target: '/news'),
          const ListButton(
              title: "關於競賽", icon: "people", current: false, target: '/about'),
          const ListButton(
              title: "職類介紹", icon: "cup", current: false, target: '/job'),
        ],
      ),
    );
  }
}
