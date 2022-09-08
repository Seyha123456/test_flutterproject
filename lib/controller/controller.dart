import 'package:flutter_fvm/repo/repo.dart';
import 'package:get/get.dart';
import '../model/model.dart';

class PokemonController extends GetxController {
  var isLoading = true.obs;
  var productList = <Pokemon>[].obs;
  final hasNext = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
