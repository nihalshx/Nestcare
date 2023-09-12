import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../model/categories_model.dart';
import '../model/pet_model.dart';

////// category data in firebase/////////

class  CategoriesProvider with ChangeNotifier{

  final FirebaseFirestore dB = FirebaseFirestore.instance;

  List<CategoriesModel> categorysList =[];
  List<PetModel> petByCategoryList =[];


  Future getCategoriesData() async{
    List<CategoriesModel> newList =[];
    CategoriesModel categoriesModel;

    QuerySnapshot data = await dB.collection("Categories").get();
    for(QueryDocumentSnapshot element in data.docs){
      if(element.exists){
        categoriesModel = CategoriesModel.fromJson(element.data());
        newList.add(categoriesModel);
        notifyListeners();

      }
    }
    categorysList = newList;
    notifyListeners();
     return categorysList;




  }

  Future getPetByCategory(String categoryName)async {
    PetModel petModel;
    List<PetModel> newList =[];
    QuerySnapshot data = await dB.collection('Pet').get();
    for (var element in data.docs){


      if(element.exists){
      if(categoryName == element.get("petCategory") ){

        petModel=PetModel.fromJson(element.data());
        newList.add(petModel);
        notifyListeners();

      }


      }
    }
    petByCategoryList = newList;
    notifyListeners();
    return petByCategoryList;
  }



}