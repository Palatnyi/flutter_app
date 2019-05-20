import 'package:flutter/material.dart';

class TitleDefault extends StatelessWidget {
  final String title;
  TitleDefault(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(title,
            style: TextStyle(fontFamily: 'Oswald', fontSize: 26)));
  }
}
