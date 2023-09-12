
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/single_category.dart';
import '../../repos/provider/category_provider.dart';

class CategoriesViewAll extends StatefulWidget {

  const CategoriesViewAll({Key? key,}) : super(key: key);

  @override
  State<CategoriesViewAll> createState() => _CategoriesViewAllState();
}

class _CategoriesViewAllState extends State<CategoriesViewAll> {
  @override
  Widget build(BuildContext context) {
    CategoriesProvider categoriesProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black54,
            )),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
          const   Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(height: 10,),
            GridView.builder(
              itemCount: categoriesProvider.categorysList.length,
              shrinkWrap: true,
              
               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,
                  childAspectRatio: 1.40,
                  mainAxisSpacing: 20
               ),
              itemBuilder: (BuildContext context, int index) {
               return SingleCategory(categoriesModel: categoriesProvider.categorysList[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
