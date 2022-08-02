import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../utils/image_helper.dart';


class NumericStepButton extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int? initialValue;
  final bool hasPermission;
  final Color color;
  final ValueChanged<int?> onChanged;
  //ShowTypeController controller = Get.put(ShowTypeController());
  NumericStepButton({
    Key? key,
    this.minValue = 0,
    this.maxValue = 100000,
    this.initialValue = 0,
    this.hasPermission = true,
    this.color = const Color(0xFFFFFFFF),
    required this.onChanged,
  }) : super(key: key);

  @override
  State<NumericStepButton> createState() {
    return _NumericStepButtonState();
  }
}

class _NumericStepButtonState extends State<NumericStepButton> {
 // ShowTypeController controller = Get.put(ShowTypeController());
  int counter = 0;
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    if (widget.initialValue != null) {
      counter = widget.initialValue!;
      textEditingController.text = widget.initialValue.toString();
    }
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void increment() {
    FocusManager.instance.primaryFocus!.unfocus();
    setState(() {
      if (counter < widget.maxValue) counter++;
      textEditingController.text = counter.toString();
      widget.onChanged(counter);
    });
  }

  void decrement() {
    FocusManager.instance.primaryFocus!.unfocus();
    setState(() {
      if (counter > widget.minValue) counter--;
      textEditingController.text = counter.toString();
      widget.onChanged(counter);
    });
  }

  bool hasValidValue(String? value) {
    if (value == null) return true;
    if (value.isEmpty) return true;
    int counter = int.tryParse(value) ?? -1;
    return (counter == -1)
        ? false
        : ((counter >= widget.minValue) && (counter <= widget.maxValue));
  }

  bool isValidNumber(String? value) {
    bool result = hasValidValue(value);
    return result;
  }

  Widget incrementButton() => GestureDetector(
      onTap: () {
     /* if(int.parse(controller.Extrapakage_Count.value) < int.parse(controller.package_entertainer.value)) {
      increment();
     }*/
      },
      child: SvgPicture.asset(
        BTN_ADD,
        height: 20,
        width: 20,
      ));

  Widget decrementButton() => GestureDetector(
      onTap: () {
        decrement();
      },
      child: SvgPicture.asset(
        BTN_REMOVE,
        height: 20,
        width: 20,
      ));

  Container textFormFieldWidget() => Container(
      height: 30,
      width: 30,
      child: Center(
        child: TextFormField(
          style: TextStyle(
            color: widget.color,
          ),
          readOnly: true,
          controller: textEditingController,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLines: 1,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => (isValidNumber(value)) ? null : "",
          onChanged: (value) {
            if (isValidNumber(value)) {
              if (value.isEmpty) {
                counter = 0;
                widget.onChanged(0);
              } else {
                counter = int.parse(value);
                widget.onChanged(counter);
              }
            } else {
              widget.onChanged(-1);
            }
          },
          cursorColor: widget.color,
          decoration: InputDecoration(
            labelStyle: const TextStyle(height: 0),
            errorStyle: const TextStyle(height: 0),
            hintStyle: const TextStyle(height: 0),
            focusedErrorBorder: getBorder(Colors.transparent),
            focusedBorder: getBorder(
              widget.hasPermission ? widget.color : Colors.transparent,
            ),
            enabledBorder: getBorder(Colors.transparent),
            isDense: true,
            errorMaxLines: 1,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
            errorBorder: getBorder(Colors.transparent),
            disabledBorder: getBorder(Colors.transparent),
            counterText: '',
          ),
        ),
      ));

  OutlineInputBorder getBorder(Color color) => OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        gapPadding: 0.0,
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        decrementButton(),
        textFormFieldWidget(),
        incrementButton(),
      ],
    );
  }
}
