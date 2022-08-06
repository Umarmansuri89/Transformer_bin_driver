import 'package:flutter/material.dart';

class TabCreateDesing extends StatelessWidget {
  final String title;

  const TabCreateDesing({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border:
              Border.all(color: Theme.of(context).primaryColor, width: 1)),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
