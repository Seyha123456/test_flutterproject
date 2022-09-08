import 'package:flutter/material.dart';
import 'package:flutter_fvm/controller/controller.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'product_list.dart';

class HomePage extends StatelessWidget {
  final PokemonController productController = Get.put(PokemonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Pokemon',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: productController.productList.length + 1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    if (index < productController.productList.length) {
                      return ProductTile(productController.productList, index);
                    } else if (productController.hasNext.value) {
                      return SizedBox();
                    } else {
                      return SizedBox();
                    }
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                );
            }),
          )
        ],
      ),
    );
  }
}
