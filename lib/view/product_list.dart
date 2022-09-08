import 'package:flutter/material.dart';
import 'package:flutter_fvm/model/model.dart';
import 'package:flutter_fvm/view/detail_page.dart';
import 'package:get/get.dart';

Widget ProductTile(final List<Pokemon>? product, index) {
  return GestureDetector(
    onTap: () => Get.to(DetailPage(
      pokemon: product,
      data: index,
    )),
    child: Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(
                    product![index].imageurl.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              product[index].name.toString(),
              maxLines: 2,
              style:
                  TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product[index].id.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.star,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Text('\$${product[index].typeofpokemon}',
                style: TextStyle(fontSize: 32, fontFamily: 'avenir')),
          ],
        ),
      ),
    ),
  );
}
