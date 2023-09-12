// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:Nestcare/repos/model/favorite_model.dart';
import 'package:Nestcare/repos/model/pet_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class PetProvider with ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController addressLane = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  int cartBadge = 0;
  //List<CartModel> cartItemSaveList = [];
  List<FavoriteModel> favoriteItemSaveList = [];
  List<PetModel> featuredPetList =[];


  final FirebaseFirestore dB = FirebaseFirestore.instance;


  Future addToFavorite(FavoriteModel favoriteModel) async {
    // ignore: iterable_contains_unrelated_type
    favoriteItemSaveList.removeWhere(
        (element) => element.favoriteId == favoriteModel.favoriteId);

    favoriteItemSaveList.insert(0, favoriteModel);
    notifyListeners();

    return favoriteItemSaveList;
  }

  Future deleteFavorite(int index) async {
    favoriteItemSaveList.removeAt(index);
    notifyListeners();
  }

  List<PetModel> search(String query) {
    List<PetModel> petSearch = featuredPetList.where((element){
      return element.petName.contains(query);
    }).toList();
    return petSearch;
  }

  void addressValidator(context) async {
    if (addressLane.text.isEmpty) {
      Fluttertoast.showToast(msg: "address lane is empty");
    } else if (name.text.isEmpty) {
      Fluttertoast.showToast(msg: "name is empty");
    } else if (city.text.isEmpty) {
      Fluttertoast.showToast(msg: "city is empty");
    } else if (postalCode.text.isEmpty) {
      Fluttertoast.showToast(msg: "password is empty");
    } else if (phoneNumber.text.isEmpty) {
      Fluttertoast.showToast(msg: "password is empty");
    } else {

      notifyListeners();
      Fluttertoast.showToast(msg: "add your address please go back");
    }
  }


  Future getFeaturedPet() async{
    PetModel petModel;
    List<PetModel> newList =[];
    QuerySnapshot data = await dB.collection('Pet').get();
    for (var element in data.docs){

      if(element.exists){
        petModel=PetModel.fromJson(element.data());
        newList.add(petModel);
        notifyListeners();

      }
    }
    featuredPetList = newList;
    notifyListeners();
    return featuredPetList;
  }






}

