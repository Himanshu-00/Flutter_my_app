import 'package:get/get.dart';
import 'package:my_app/controllers/cart_controller.dart';
import 'package:my_app/controllers/popular_product_controller.dart';
import 'package:my_app/controllers/recommended_product_controller.dart';
import 'package:my_app/data/api/api_client.dart';
import 'package:my_app/data/repository/popular_product_repo.dart';
import 'package:my_app/data/repository/recommended_product_repo.dart';

import '../data/repository/cart_repo.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: "http://127.0.0.1:8000"));

  // repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  // controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
