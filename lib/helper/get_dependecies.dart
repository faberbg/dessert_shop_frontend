import 'package:shared_preferences/shared_preferences.dart';
import 'package:dessert_shop/controllers/auth_controller.dart';
import 'package:dessert_shop/controllers/cart_controller.dart';
import 'package:dessert_shop/controllers/location_controller.dart';
import 'package:dessert_shop/controllers/popular_product.dart';
import 'package:dessert_shop/controllers/product_controller.dart';
import 'package:get/get.dart';
import 'package:dessert_shop/controllers/search_product_controller.dart';
import 'package:dessert_shop/controllers/user_controller.dart';
import 'package:dessert_shop/data/api/api_client.dart';
import 'package:dessert_shop/data/repos/auth_repo.dart';
import 'package:dessert_shop/data/repos/cart_repo.dart';
import 'package:dessert_shop/data/repos/location_repo.dart';
import 'package:dessert_shop/data/repos/order_controller.dart';
import 'package:dessert_shop/data/repos/order_repo.dart';
import 'package:dessert_shop/data/repos/popular_product_repo.dart';
import 'package:dessert_shop/data/repos/product_repo.dart';
import 'package:dessert_shop/data/repos/search_product_repo.dart';
import 'package:dessert_shop/data/repos/user_repo.dart';
import 'package:dessert_shop/uitls/app_constants.dart';

import '../controllers/splash_controller.dart';
import '../data/repos/splash_repo.dart';

Future<void> init() async {

  final sharedPreference = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreference);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));

  Get.lazyPut(() => SplashRepo(sharedPreferences: Get.find(), apiClient: Get.find()));
  //first load the repos
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => LocationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  Get.lazyPut(() => UserRepo(apiClient: Get.find()));
  Get.lazyPut(() => ProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  Get.lazyPut(() => OrderRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => SearchProductRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  //controllers
  Get.lazyPut(() => SplashController(splashRepo: Get.find()));

  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));

  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => ProductController(productRepo: Get.find()));
  Get.lazyPut(() => PopularProduct(popularProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo:Get.find()));
  Get.lazyPut(() => OrderController(orderRepo: Get.find()));
  Get.lazyPut(() => SearchProductController(searchProductRepo: Get.find()));
}