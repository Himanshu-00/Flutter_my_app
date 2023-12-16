import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/utility/dimensions.dart';
import 'package:my_app/widgets/small_text.dart';
import 'icon_and_text_widget.dart';

import '../Utility/colors.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      BigText(
        text: text,
        size: Dimensions.font26,
      ),
      SizedBox(height: Dimensions.height20),
      Row(
        children: [
          Wrap(
            children: List.generate(5, (index) {
              return Icon(
                Icons.star,
                color: AppColors.mainColor,
                size: 15,
              );
            }),
          ),
          SizedBox(
            width: 10,
          ),
          SmallText(text: "4.5"),
          SizedBox(
            width: 10,
          ),
          SmallText(text: "1287"),
          SizedBox(
            width: 10,
          ),
          SmallText(text: "comments")
        ],
      ),
      SizedBox(
        height: 10,
      ),
      //time and distance
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconAndTextWidget(
            icon: Icons.circle_sharp,
            text: "Normal",
            iconColor: AppColors.iconColor1),
        IconAndTextWidget(
            icon: Icons.location_on,
            text: "1.7km",
            iconColor: AppColors.mainColor),
        IconAndTextWidget(
            icon: Icons.access_time_rounded,
            text: "32Min",
            iconColor: AppColors.iconColor2)
      ])
    ]);
  }
}
