import 'package:foodie/domain/entities/categories/categories.dart';

class CategoryList {
  static final List<CategoryItem> categories = [
    CategoryItem(
      imagePath: 'assets/comidas.png',
      category: 'comida',
    ),
    CategoryItem(
      imagePath: 'assets/bebidas.png',
      category: 'bebida',
    ),
    CategoryItem(
      imagePath: 'assets/snacks.png',
      category: 'snack',
    ),
    CategoryItem(
      imagePath: 'assets/temporada.png',
      category: 'temporada',
    ),
  ];
}
