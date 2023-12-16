import 'package:flutter/material.dart';
import 'package:my_app/controllers/popular_product_controller.dart';
import 'package:my_app/controllers/recommended_product_controller.dart';
import 'package:my_app/pages/Home/food_page_body.dart';
import 'package:my_app/pages/Home/home_page.dart';
import 'package:my_app/pages/Home/main_food_page.dart';
import 'package:my_app/pages/cart/cart_page.dart';
import 'package:my_app/pages/food/popular_food_detail.dart';
import 'package:my_app/pages/food/recommended_food_detail.dart';
import 'package:my_app/pages/splash/splash_page.dart';
import 'package:my_app/routes/route_helper.dart';

import 'pages/Home/main_food_page.dart';
import 'package:get/get.dart';
import 'package:my_app/helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          //home: SplashScreen(),
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}
