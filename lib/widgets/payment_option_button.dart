import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/controllers/order_controller.dart';
import 'package:my_app/utility/colors.dart';
import 'package:my_app/utility/dimensions.dart';
import 'package:get/get.dart';

import '../utility/style.dart';

class PaymentOptionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final int index;
  const PaymentOptionButton(
      {Key? key,
      required this.index,
      required this.icon,
      required this.title,
      required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(index),
      child: Container(
          padding: EdgeInsets.only(
              bottom: Dimensions.height30 / 2, top: Dimensions.height45 / 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: Theme.of(context).cardColor,
              boxShadow: [BoxShadow()]),
          child: ListTile(
              leading: Icon(
                icon,
                size: 40,
                color: Theme.of(context).backgroundColor,
              ),
              title: Text(
                title,
                style: robotoMedium.copyWith(fontSize: Dimensions.font20),
              ),
              subtitle: Text(
                subTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: robotoRegular.copyWith(
                  color: Theme.of(context).disabledColor,
                  fontSize: Dimensions.font16,
                ),
              ),
              trailing: Icon(
                Icons.playlist_add_check_circle_rounded,
                color: Theme.of(context).primaryColor,
              ))),
    );

    //*Trash corner*//
    //GetBuilder<OrderController>(builder: (orderController) {
    //
    // return InkWell(
    //   onTap: () => orderController.setPaymentIndex(index),
    //   child: Container(
    //     padding: EdgeInsets.only(bottom: Dimensions.height10 / 2),
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(Dimensions.radius20 / 4),
    //         color: Theme.of(context).cardColor,
    //         boxShadow: [
    //           BoxShadow(
    //               color: Colors.grey[200]!, blurRadius: 5, spreadRadius: 1)
    //         ]),
  }
}
