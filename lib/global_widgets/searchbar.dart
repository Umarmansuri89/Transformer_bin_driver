import 'package:flutter/material.dart';
import '../utils/image_helper.dart';

class SearchBarDesing extends StatelessWidget {
  final double height;
  final bool readOnly;
  final Function()? onTap;
  final Function()? onDone;
  final TextEditingController? controller;
  final ValueChanged<String>? onSearchTextChange;

  SearchBarDesing({
    required this.height,
    required this.readOnly,
    this.onTap,
    this.onDone,
    this.controller,
    this.onSearchTextChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 8, left: 15, right: 15),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(RECTANGLE_CITY)),
        ),
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 20),
            Icon(
              Icons.search,
              color: Colors.white,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                textInputAction: TextInputAction.done,
                onEditingComplete: onDone,
                onChanged: onSearchTextChange,
                controller: controller,
                onTap: onTap,
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
                readOnly: readOnly,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
