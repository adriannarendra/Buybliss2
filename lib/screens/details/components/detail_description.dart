import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:buybliss2/constant.dart';
import 'package:buybliss2/model/product_data.dart';
import 'package:buybliss2/sized_config.dart';
import 'package:buybliss2/state_managements/favourite_provider.dart';

class DetailDescription extends StatefulWidget {
  const DetailDescription({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<DetailDescription> createState() => _DetailDescriptionState();
}

class _DetailDescriptionState extends State<DetailDescription> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
          child: Text(
            widget.product.title,
            style: TextStyle(
              fontSize: getPropScreenWidth(20),
              fontWeight: FontWeight.bold,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getPropScreenWidth(15)),
            width: getPropScreenWidth(64),
            decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(getPropScreenWidth(20)),
                    bottomLeft: Radius.circular(getPropScreenWidth(20)))),
            child: Consumer<FavouriteProvider>(
              builder: (context, favourite, child) => InkWell(
                onTap: () {
                  favourite.toggleFavouriteStatus(widget.product.id);
                },
                child: Icon(
                  Icons.favorite,
                  color: widget.product.isFavourite
                      ? Colors.red
                      : kSecoundaryColor.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getPropScreenWidth(20),
            right: getPropScreenWidth(64),
          ),
          child: ReadMoreText(
            widget.product.description,
            trimMode: TrimMode.Line,
            trimLines: 2,
            colorClickableText: kPrimaryColor,
            trimCollapsedText: "\n> See more",
            trimExpandedText: "\n< See less",
            moreStyle: seeMoreStyle,
            lessStyle: seeMoreStyle,
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
