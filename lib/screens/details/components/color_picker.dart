import 'package:flutter/material.dart';
import 'package:buybliss2/constant.dart';
import 'package:buybliss2/sized_config.dart';

// class ColorPicker extends StatefulWidget {
//   const ColorPicker({
//     super.key,
//     required this.product,
//   });

//   final Product product;

//   @override
//   State<ColorPicker> createState() => _ColorPickerState();
// }

// class _ColorPickerState extends State<ColorPicker> {
//   int currentSelectionColor = 0;
//   int totalSelected = 1;
//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }

class ItemColorDot extends StatelessWidget {
  const ItemColorDot({super.key, required this.color, this.isSelected = false});

  final bool isSelected;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: defaultDuration,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(getPropScreenWidth(8)),
      height: getPropScreenWidth(isSelected ? 30 : 20),
      width: getPropScreenWidth(isSelected ? 30 : 20),
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
              color: isSelected ? kPrimaryColor : Colors.transparent,
              width: 1.5)),
    );
  }
}
