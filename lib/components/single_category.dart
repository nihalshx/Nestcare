import 'package:Nestcare/screens/categories/categories_product_page.dart';
import 'package:Nestcare/repos/model/categories_model.dart';

import 'package:flutter/material.dart';

class SingleCategory extends StatelessWidget {
  final CategoriesModel categoriesModel;
  const SingleCategory({Key? key, required this.categoriesModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                CategoryProductPage(categoryName: categoriesModel.categoryName),
          ),
        );
      },
      child: Container(
        width: 120,
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(const Color(0xff3F3F3F).withOpacity(1),  BlendMode.softLight,),
            image: NetworkImage(categoriesModel.categoryImage),
          ),
        ),
        child: Center(
          child: Text(
            categoriesModel.categoryName,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
