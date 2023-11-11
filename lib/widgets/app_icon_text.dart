import 'package:flutter/material.dart';

class AppIconText extends StatelessWidget {
  final Icon icon;
  final Text text;
  const AppIconText({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(
          width: 4,
        ),
        text
      ],
    );
  }
}
