import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_app/controllers/cart_controller.dart';
import 'package:my_app/controllers/popular_product_controller.dart';

import 'package:my_app/pages/Home/main_food_page.dart';
import 'package:my_app/routes/route_helper.dart';
import 'package:my_app/utility/app_constants.dart';
import 'package:my_app/utility/colors.dart';
import 'package:my_app/utility/dimensions.dart';
import 'package:my_app/widgets/app_icon.dart';
import 'package:my_app/widgets/big_text.dart';
import 'package:my_app/widgets/common_text_button.dart';
import 'package:my_app/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../controllers/recommended_product_controller.dart';
import '../../widgets/delivery_options.dart';
import '../../widgets/payment_option_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.height20 * 3,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconsize: Dimensions.iconSize24,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width20 * 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconsize: Dimensions.iconSize24,
                    ),
                  ),
                  // AppIcon(
                  //   icon: Icons.shopping_cart,
                  //   iconColor: Colors.white,
                  //   backgroundColor: AppColors.mainColor,
                  //   iconsize: Dimensions.iconSize24,
                  // ),
                ],
              )),
          Positioned(
              top: Dimensions.height20 * 6,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                  margin: EdgeInsets.only(top: Dimensions.height15),
                  //color: Colors.red,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child:
                        GetBuilder<CartController>(builder: (cartController) {
                      var _cartList = cartController.getItems;
                      return ListView.builder(
                          itemCount: _cartList.length,
                          itemBuilder: (_, index) {
                            return Container(
                                width: double.maxFinite,
                                height: Dimensions.height20 * 5,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        var popularindex =
                                            Get.find<PopularProductController>()
                                                .popularProductList
                                                .indexOf(
                                                    _cartList[index].product!);
                                        if (popularindex >= 0) {
                                          Get.toNamed(
                                              RouteHelper.getPopularFood(
                                                  popularindex, "cartpage"));
                                        } else {
                                          var recommendedIndex = Get.find<
                                                  RecommendedProductController>()
                                              .recommendedProductList
                                              .indexOf(
                                                  _cartList[index].product!);
                                          Get.toNamed(
                                              RouteHelper.getRecommendedFood(
                                                  recommendedIndex,
                                                  "cartpage"));
                                        }
                                      },
                                      child: Container(
                                        width: Dimensions.height20 * 5,
                                        height: Dimensions.height20 * 5,
                                        margin: EdgeInsets.only(
                                            bottom: Dimensions.height10),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(AppConstants
                                                        .BASE_URL +
                                                    AppConstants.UPLOAD_URL +
                                                    cartController
                                                        .getItems[index].img!)),
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radius20),
                                            color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      width: Dimensions.width10,
                                    ),
                                    Expanded(
                                        child: Container(
                                      height: Dimensions.height20 * 5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          BigText(
                                            text: cartController
                                                .getItems[index].name!,
                                            color: Colors.black54,
                                          ),
                                          SmallText(text: "Spicy"),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              BigText(
                                                text: cartController
                                                    .getItems[index].price
                                                    .toString(),
                                                color: Colors.redAccent,
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: Dimensions.height10,
                                                    bottom: Dimensions.height10,
                                                    left: Dimensions.width10,
                                                    right: Dimensions.width10),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimensions
                                                                .radius20),
                                                    color: Colors.white),
                                                child: Row(children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      cartController.addItem(
                                                          _cartList[index]
                                                              .product!,
                                                          -1);
                                                    },
                                                    child: Icon(
                                                      Icons.remove,
                                                      color:
                                                          AppColors.signColor,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        Dimensions.width10 / 2,
                                                  ),
                                                  BigText(
                                                      text: _cartList[index]
                                                          .quantity
                                                          .toString()), //popularProduct.inCarItems.toString()),
                                                  SizedBox(
                                                    width:
                                                        Dimensions.width10 / 2,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      cartController.addItem(
                                                          _cartList[index]
                                                              .product!,
                                                          1);
                                                    },
                                                    child: Icon(
                                                      Icons.add,
                                                      color:
                                                          AppColors.signColor,
                                                    ),
                                                  )
                                                ]),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ))
                                  ],
                                ));
                          });
                    }),
                  )))
        ],
      ),
      bottomNavigationBar:
          GetBuilder<CartController>(builder: (cartController) {
        return Container(
            height: Dimensions.bottomheightBar + 90,
            padding: EdgeInsets.only(
              top: Dimensions.height10,
              bottom: Dimensions.height10,
              left: Dimensions.width20,
              right: Dimensions.width20,
            ),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2))),
            child: cartController.getItems.length > 0
                ? Column(
                    children: [
                      InkWell(
                        onTap: () => showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (_) {
                              return Column(
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.9,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    Dimensions.radius20),
                                                topRight: Radius.circular(
                                                    Dimensions.radius20))),
                                        child: Column(children: [
                                          Container(
                                            height: 520,
                                            child: Column(
                                              children: [
                                                const PaymentOptionButton(
                                                  icon: Icons.money,
                                                  title: 'cash on delivery',
                                                  subTitle:
                                                      'you pay after getting the delivery',
                                                  index: 0,
                                                ),
                                                SizedBox(
                                                    height:
                                                        Dimensions.height10 /
                                                            2),
                                              ],
                                            ),
                                          )
                                        ]),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }),
                        child: SizedBox(
                          width: double.maxFinite,
                          child: CommonTextButton(text: "payment options"),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                top: Dimensions.height10,
                                bottom: Dimensions.width10,
                                left: Dimensions.width10,
                                right: Dimensions.width10),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20),
                                color: Colors.white),
                            child: Row(
                              children: [
                                Text("-"),
                                SizedBox(
                                  width: Dimensions.width10 / 2,
                                ),
                                BigText(
                                    text: "\Rs" +
                                        cartController.totalAmount.toString()),
                                SizedBox(
                                  width: Dimensions.width10 / 2,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RouteHelper.getPaymentPage());
                            },
                            child: CommonTextButton(
                              text: "check out",
                            ),
                          )
                        ],
                      )
                    ],
                  )
                : Container());
      }),
    );
  }
}
