import 'package:flutter/material.dart';
import 'package:my_app/utility/colors.dart';
import 'package:my_app/pages/Home/food_page_body.dart';
import 'package:my_app/utility/dimensions.dart';
import 'package:my_app/widgets/big_text.dart';
import 'package:my_app/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("current height is " + MediaQuery.of(context).size.height.toString());
    return Scaffold(
        body: Column(children: [
      //showing the header
      Container(
        child: Container(
          margin: EdgeInsets.only(
              top: Dimensions.height45, bottom: Dimensions.height30 / 2),
          padding: EdgeInsets.only(
              top: Dimensions.height15,
              left: Dimensions.width30,
              right: Dimensions.width20,
              bottom: Dimensions.height15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  BigText(text: "Maharashtra", color: AppColors.mainColor),
                  Row(
                    children: [
                      SmallText(
                        text: "Mumbai",
                        color: Colors.black54,
                      ),
                      Icon(Icons.arrow_drop_down_rounded)
                    ],
                  )
                ],
              ),
              // Center(
              //   child: Container(
              //     width: Dimensions.height45,
              //     height: Dimensions.height45,
              //     child: Icon(
              //       Icons.search,
              //       color: Colors.white,
              //       size: Dimensions.iconSize24,
              //     ),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(Dimensions.radius15),
              //       color: AppColors.mainColor,
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
      //showing the body
      Expanded(
        child: SingleChildScrollView(
          child: FoodPageBody(),
        ),
      ),
    ]));
  }
}
