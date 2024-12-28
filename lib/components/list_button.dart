import 'package:flutter/material.dart';

class ListButton extends StatelessWidget {
  final String title;
  final String icon;
  final String target;
  final bool current;
  const ListButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.current,
      required this.target});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Stack(children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset("assets/icons/$icon.png", height: 25),
            ),
            Align(
                alignment: Alignment.center,
                child: Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 7,
                          fontWeight:
                              current ? FontWeight.bold : FontWeight.normal),
                    )))
          ])),
      onTap: () {
        Navigator.pushNamed(context, target);
      },
    );
  }
}
