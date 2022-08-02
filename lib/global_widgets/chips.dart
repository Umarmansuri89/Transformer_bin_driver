import 'package:flutter/material.dart';


class ChipsButton extends StatelessWidget {
  final bool isSelected;
  final String text;
  final Function()? onTap;

  const ChipsButton({
    Key? key,
    required this.isSelected,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            width: 1,
            color: isSelected
                ? Theme.of(context).primaryColor
                : const Color(0xff848484),
          ),
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
          top: 5,
          bottom: 5,
        ),
        child: SizedBox(
          width: 81.10,
          // height: 16.80,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : const Color(0xff848484),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
