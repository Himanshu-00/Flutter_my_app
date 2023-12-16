import 'package:flutter/material.dart';
import 'package:my_app/utility/dimensions.dart';

class DeliveryOptions extends StatelessWidget {
  final String value;
  final String title;
  final double amount;
  final bool isFree;

  const DeliveryOptions(
      {Key? key,
      required this.value,
      required this.title,
      required this.amount,
      required this.isFree})
      : super(key: key);

  get robotoRegular => null;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          onChanged: (value) {
            print(value.toString());
          },
          groupValue: "delivery",
          value: value,
        ),
        SizedBox(
          width: Dimensions.width10 / 2,
        ),
        Text(
          title,
          style: robotoRegular,
        ),
        SizedBox(
          width: Dimensions.width10 / 2,
        ),
        Text(
            '(${(value == 'take away' || isFree) ? 'free' : '\$${amount / 10}'})')
      ],
    );
  }
}
