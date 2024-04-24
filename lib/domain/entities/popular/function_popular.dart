import 'package:foodie/domain/entities/details/funtion_details.dart';
import 'package:foodie/domain/entities/products/products.dart';
import 'package:foodie/ui/pages/popular_product/widget/popular_widget.dart';

class FunctionPopular {
  static Future<List<PopularesItem>> getPopularItems(context) async {
    ProductService productService = ProductService();
    List<Product> products =
        await productService.getProducts(limit: 10, ordeBy: 'price');

    return products.map((product) {
      final name = product.name;
      final price = product.price;
      final img = product.img;
      final description = product.descripcion;

      return PopularesItem(
        name: name,
        price: price,
        img: img,
        onTap: () {
          FuntionDetails.NavegeteDetails(
              context, name, price, img, description);
        },
      );
    }).toList();
  }
}
