
class PetModel {
  final String petName;
  final List<dynamic> petImages;
  //final List<dynamic> productSizes;
  //final List<dynamic> productColors;
  final String petId;
  final String petCategory;
  final String petDescription;
 // final int petRate;
  //final int productPrice;
  final String petSex;
  final String petBreed;
  final String petLocation;
  final String petAge;
   final int petNum;

  PetModel({
    required this.petCategory,
    //required this.productColors,
    required this.petDescription,
    required this.petId,
    required this.petImages,
    required this.petName,
    //required this.productPrice,
    //required this.petRate,
    //required this.productSizes,
      required this.petSex,
      required this.petAge,
      required this.petBreed,
      required this.petLocation,
      required this.petNum,
  });

  factory PetModel.fromJson(json) => PetModel(
        petCategory: json["petCategory"],
        //productColors: json["productColors"],
        petDescription: json["petDescription"],
        petId: json["petId"],
        petImages: json["petImages"],
        petName: json["petName"],
        //productPrice: json["productPrice"],
        //petRate: json["petRate"],
        //productSizes: json["productSizes"],
          petSex: json["petSex"],
          petAge: json["petAge"],
          petBreed: json["petBreed"],
           petLocation: json["petLocation"],
          petNum: json["petNum"],

      );


}
