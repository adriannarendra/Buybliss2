import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:buybliss2/constant.dart';
import 'package:buybliss2/model/category_data.dart';
import 'package:buybliss2/sized_config.dart';

Padding ItemCategoris() {
  return Padding(
    padding: EdgeInsets.all(getPropScreenWidth(20)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        listCategory.length,
        (index) => ItemCategory(
          name: listCategory[index].name,
          icon: listCategory[index].icon,
        ),
      ),
    ),
  );
}

class ItemCategory extends StatelessWidget {
  const ItemCategory({
    super.key,
    required this.name,
    required this.icon,
  });

  final String name, icon;

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;

    return SizedBox(
      width: getPropScreenWidth(55),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(getPropScreenWidth(15)),
            width: getPropScreenWidth(55),
            height: getPropScreenWidth(55),
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(icon, color: Colors.white),
          ),
          SizedBox(
            height: getPropScreenHeight(5),
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(color: textColor), 
          ),
        ],
      ),
    );
  }
}
