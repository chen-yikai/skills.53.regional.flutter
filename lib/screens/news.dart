import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skills_53_regional_flutter/components/color.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<List<dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    loadcsv();
  }

  Future<void> loadcsv() async {
    final csvData = await rootBundle.loadString('assets/data/news.csv');
    List<List<dynamic>> listData = const CsvToListConverter().convert(csvData);
    setState(() {
      debugPrint("load");
      data = listData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(child: Image.asset("assets/bg.png")),
          Container(color: blue, height: 150),
          SafeArea(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Image.asset(
                                "assets/icons/white_arrow_left.png",
                                height: 15)),
                      ),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "最新",
                                style: topBarTextStyle.copyWith(
                                    fontWeight: FontWeight.normal)),
                            TextSpan(
                                text: "消息",
                                style: topBarTextStyle.copyWith(
                                    fontWeight: FontWeight.bold))
                          ]))),
                      Container(
                          padding: const EdgeInsets.only(top: 50),
                          child: Center(
                            child: data.isEmpty
                                ? const CircularProgressIndicator()
                                : ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                10), // Set the radius here
                                          ),
                                          padding: const EdgeInsets.all(5),
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: ListTile(
                                            subtitle: Text(
                                                data[index][0].toString(),
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.normal,
                                                )),
                                            title: Text(
                                              data[index][1].toString(),
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  fontFamily: "monospace",
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ));
                                    }),
                          ))
                    ],
                  )))
        ],
      ),
    );
  }

  final topBarTextStyle =
      const TextStyle(fontSize: 25, letterSpacing: 5, color: Colors.white);
}
