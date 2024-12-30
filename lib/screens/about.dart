import 'package:flutter/material.dart';
import 'package:skills_53_regional_flutter/components/color.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(child: Image.asset('assets/bg.png')),
          Container(color: blue, height: 150),
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
              child: Stack(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset("assets/icons/white_arrow_left.png",
                          height: 15)),
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "關於",
                          style: topBarTextStyle.copyWith(
                              fontWeight: FontWeight.normal)),
                      TextSpan(
                          text: "競賽",
                          style: topBarTextStyle.copyWith(
                              fontWeight: FontWeight.bold))
                    ]))),
              ])),
        ],
      ),
    );
  }

  final topBarTextStyle =
      const TextStyle(fontSize: 25, letterSpacing: 5, color: Colors.white);
}
