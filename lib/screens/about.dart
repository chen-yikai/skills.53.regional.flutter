import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skills_53_regional_flutter/components/color.dart';

class AboutScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const AboutScreen({super.key, required this.scaffoldKey});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Tab> tabs = [];

  List<Widget> tabsContent = [
    Center(
      child: Text("data"),
    ),
    Center(
      child: Text("data"),
    ),
    Center(
      child: Text("data"),
    ),
    Center(
      child: Text("data"),
    ),
    Center(
      child: Text("data"),
    ),
  ];

  @override
  void initState() {
    super.initState();
    loadcsv();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  Future<void> loadcsv() async {
    final csvData = await rootBundle.loadString('assets/data/about/about.csv');
    List<List<dynamic>> listData = const CsvToListConverter().convert(csvData);
    listData.forEach((item) {
      print(item[0].toString());
      tabs.add(Tab(
        child: Text(item[0]),
      ));
      // tabsContent.add(Expanded(
      //     child: SingleChildScrollView(
      //   child: Text(item[1].toString()),
      // )));
      setState(() {
        _tabController = TabController(length: 5, vsync: this);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            flexibleSpace: Container(
          height: 200,
          color: blue,
          child: Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
                  child: Column(children: [
                    Stack(children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                            onPressed: () {
                              widget.scaffoldKey.currentState?.openDrawer();
                            },
                            icon: Image.asset(
                                "assets/icons/white_arrow_left.png",
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
                    ]),
                  ])),
            ],
          ),
        )),
        body: Stack(
          children: [
            _tabController.length > 0
                ? TabBarView(controller: _tabController, children: tabsContent)
                : Center(child: CircularProgressIndicator()),
            Container(
                color: blue,
                child: TabBar(
                  labelStyle: TextStyle(color: Colors.white),
                  tabs: tabs,
                  controller: _tabController,
                ))
          ],
        ));
  }

  final topBarTextStyle =
      const TextStyle(fontSize: 25, letterSpacing: 5, color: Colors.white);
}
