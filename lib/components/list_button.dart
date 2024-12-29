import 'package:flutter/material.dart';
import 'package:skills_53_regional_flutter/components/color.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset("assets/icons/$icon.png", height: 25),
            ),
            Align(
                alignment: Alignment.center,
                child: Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: RichText(
                        text: TextSpan(
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 5,
                                fontSize: 20),
                            children: [
                          TextSpan(
                              text: title.substring(0, 2),
                              style: const TextStyle(
                                color: Colors.black45,
                              )),
                          TextSpan(
                              text: title.substring(2, 4),
                              style: const TextStyle(
                                color: yellow,
                              ))
                        ]))))
          ])),
      onTap: () {
        Navigator.pushNamed(context, target);
      },
    );
  }
}
