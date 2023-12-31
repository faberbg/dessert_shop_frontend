import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:dessert_shop/controllers/auth_controller.dart';
import 'package:dessert_shop/controllers/cart_controller.dart';
import 'package:dessert_shop/controllers/popular_product.dart';
import 'package:dessert_shop/controllers/product_controller.dart';
import 'package:dessert_shop/controllers/user_controller.dart';
import 'package:dessert_shop/routes/route_helper.dart';
import 'package:dessert_shop/screens/food/detail_food.dart';
import 'package:dessert_shop/screens/food/more_food.dart';
import 'package:dessert_shop/uitls/scroll_behavior.dart';
import 'components/colors.dart';
import 'helper/get_dependecies.dart' as dep;
import 'package:get/get.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartsData();
      return  GetBuilder<ProductController>(builder:(_){
          return GetBuilder<PopularProduct>(builder: (_){
            return GetMaterialApp(
              scrollBehavior: AppScrollBehavior(),
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primaryColor: AppColors.mainColor,
                fontFamily: "Lato",
              ),

              initialRoute: RouteHelper.getSplashRoute(),
              getPages: RouteHelper.routes,
              defaultTransition: Transition.topLevel,
            );
          });
        });

  }
}
