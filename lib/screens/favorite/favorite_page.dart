import 'package:Nestcare/components/single_product.dart';
import 'package:Nestcare/repos/model/favorite_model.dart';
import 'package:Nestcare/repos/model/pet_model.dart';
import 'package:Nestcare/repos/provider/pet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    PetProvider petProvider = Provider.of(context);
    return Scaffold(
/*      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
        *//*      Navigator.of(context).pop();*//*
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.transparent,
            )),

      ),*/
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              "Favorite",
              style: TextStyle(fontSize: 25),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: petProvider.favoriteItemSaveList.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.63),
              itemBuilder: (BuildContext context, int index) {
                FavoriteModel favoriteModel =
                    petProvider.favoriteItemSaveList[index];
                PetModel petModel = PetModel(
                    petCategory: "",
                    //productColors: [favoriteModel.favoriteColor],
                    petDescription: favoriteModel.productDescription,
                    petId: favoriteModel.favoriteId,
                    petImages: favoriteModel.favoriteImage,
                    petName: favoriteModel.favoriteName,

                  petSex: favoriteModel.fpetSex ,
                  petAge: favoriteModel.fpetAge,
                  petBreed: favoriteModel.fpetBreed,
                  petLocation: favoriteModel.fpetLocation,
                  petNum: favoriteModel.fpetNum,
                   // productPrice: favoriteModel.favoritePrice,
                   // petRate: favoriteModel.favoriteRate,
                    //productSizes: favoriteModel.favoriteSize);
                );
                return SingleProduct(petModel: petModel);
              },
            ),
          ),
        ],
      ),
    );
  }
}
