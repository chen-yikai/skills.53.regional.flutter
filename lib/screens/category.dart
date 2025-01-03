import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:skills_53_regional_flutter/components/color.dart';

class CategoryScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CategoryScreen({super.key, required this.scaffoldKey});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<List<dynamic>> data = [];

  Future<void> load_csv() async {
    final csv_data =
        await rootBundle.loadString('assets/data/category/category.csv');
    data = CsvToListConverter().convert(csv_data);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    load_csv();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(child: Image.asset("assets/bg.png")),
        Container(color: blue, height: 150),
        SafeArea(
            child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Stack(
                  children: [
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          onPressed: () {
                            widget.scaffoldKey.currentState?.openDrawer();
                          },
                          icon: Image.asset(
                            "assets/icons/white_arrow_left.png",
                            height: 15,
                          )),
                    )),
                    Expanded(
                        child: Align(
                            alignment: Alignment.center,
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: "職類",
                                  style: topBarTextStyle.copyWith(
                                      fontWeight: FontWeight.normal)),
                              TextSpan(
                                  text: "介紹",
                                  style: topBarTextStyle.copyWith(
                                      fontWeight: FontWeight.bold))
                            ])))),
                  ],
                )),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: GridView.count(
                        crossAxisCount: 2,
                        children: data.map((item) {
                          return Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 4.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                      useSafeArea: false,
                                      context: context,
                                      builder: (context) {
                                        return Dialog.fullscreen(
                                          child: Expanded(
                                              child: Container(
                                                  decoration: const BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              "assets/bg.png"))),
                                                  child: SafeArea(
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      20),
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        context
                                                                            .pop();
                                                                      },
                                                                      icon: Image
                                                                          .asset(
                                                                        "assets/icons/blue_arrow_left.png",
                                                                        height:
                                                                            15,
                                                                      )),
                                                                  const SizedBox(
                                                                    width: 30,
                                                                  ),
                                                                  Row(
                                                                      children: [
                                                                        Text(
                                                                          item[0].toString().length == 1
                                                                              ? "0" + item[0].toString()
                                                                              : item[0].toString(),
                                                                          style: const TextStyle(
                                                                              color: yellow,
                                                                              fontFamily: "monospace",
                                                                              fontSize: 25,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                        const SizedBox(
                                                                            width:
                                                                                20),
                                                                        Text(
                                                                            item[1]
                                                                                .toString(),
                                                                            style: const TextStyle(
                                                                                color: blue,
                                                                                fontSize: 30,
                                                                                fontWeight: FontWeight.bold))
                                                                      ]),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                  height: 20),
                                                              Expanded(
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                            15),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            boxShadow: const [
                                                                              BoxShadow(
                                                                                color: Colors.black26,
                                                                                offset: Offset(0, 4),
                                                                                blurRadius: 4.0,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          child: ClipRRect(
                                                                              borderRadius: const BorderRadius.all(
                                                                                Radius.circular(15),
                                                                              ),
                                                                              child: Image.asset(
                                                                                'assets/data/category/${item[0].toString().length == 1 ? "0${item[0]}" : item[0].toString()}.png',
                                                                                width: double.infinity,
                                                                              )),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                20),
                                                                        Text(item[2]
                                                                            .toString()),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ))))),
                                        );
                                      });
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                        child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20)),
                                            child: Image.asset(
                                              'assets/data/category/${item[0].toString().length == 1 ? "0${item[0]}" : item[0].toString()}.png',
                                              width: double.infinity,
                                            ))),
                                    Expanded(
                                        child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Row(
                                              children: [
                                                Text(
                                                  item[0].toString().length == 1
                                                      ? "0" + item[0].toString()
                                                      : item[0].toString(),
                                                  style: const TextStyle(
                                                      color: yellow,
                                                      fontFamily: "monospace",
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(width: 10),
                                                Text(item[1].toString(),
                                                    style: const TextStyle(
                                                        color: blue,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold))
                                              ],
                                            )))
                                  ],
                                ),
                              ));
                        }).toList())))
          ],
        ))
      ],
    );
  }
}
