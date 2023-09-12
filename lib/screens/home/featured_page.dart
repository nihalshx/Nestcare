import 'package:Nestcare/components/single_product.dart';
import 'package:flutter/material.dart';

import '../../repos/provider/pet_provider.dart';

class FeaturedPage extends StatelessWidget {
    final  PetProvider petProvider;

  const FeaturedPage({Key? key,required this.petProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
        const   Padding(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: Text(
              "Available Pets",
              style: TextStyle(fontSize: 25),
            ),
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(
              itemCount: petProvider.featuredPetList.length,
              shrinkWrap: true,

               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,
                  childAspectRatio: 0.63
               ),
              itemBuilder: (BuildContext context, int index) {
               return SingleProduct(petModel: petProvider.featuredPetList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
