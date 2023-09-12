import 'package:get/get.dart';
import 'package:dessert_shop/data/api/api_client.dart';
import 'package:dessert_shop/models/product.dart';
import 'package:dessert_shop/uitls/app_constants.dart';

class ProductRepo extends GetxService {
  final ApiClient apiClient;
  ProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
   // print("I am repo.................");
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}