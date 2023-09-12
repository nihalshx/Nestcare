
class FavoriteModel {
  final String favoriteName;
  final List<dynamic> favoriteImage;
 // final int favoritePrice;
  //final int favoriteRate;
  final String favoriteId;
  //final List<dynamic> favoriteSize;
  final String productDescription;
  final String fpetSex;
  final String fpetBreed;
  final String fpetLocation;
  final String fpetAge;
  final int fpetNum;

 // final int favoriteColor;
  int favoriteQuantity = 1;

  FavoriteModel({
    required this.productDescription,
   // required this.favoriteColor,
    required this.favoriteImage,
    required this.favoriteId,
    required this.favoriteName,
    //required this.favoriteRate,
   // required this.favoritePrice,
   // required this.favoriteSize,
    required this.fpetSex,
    required this.fpetAge,
    required this.fpetBreed,
    required this.fpetLocation,
    required this.fpetNum,
    required this.favoriteQuantity,
  });
  factory FavoriteModel.fromJson(Map<String, dynamic> item) {
    return FavoriteModel(
     // favoriteColor: item["favoriteColor"],
      favoriteImage: item["favoriteImage"],
      favoriteName: item["favoriteName"],
      favoriteQuantity: item["favoriteQuantity"],
     // favoriteSize: item["favoriteSize"],
     // favoriteRate: item["favoriteRate"],
      //favoritePrice: item["favoritePrice"],
      productDescription: item["productDescription"],

      favoriteId: item["favoriteId"],
      fpetSex: item["fpetSex"],
      fpetAge: item["fpetAge"],
      fpetBreed: item["fpetBreed"],
      fpetLocation: item["fpetLocation"],
      fpetNum: item["fpetNum"],
    );
  }

  static Map<String, dynamic> toMap(FavoriteModel item) => {
       // 'favoriteColor': item.favoriteColor,
        'favoriteImage': item.favoriteImage,
        'favoriteName': item.favoriteName,
        'favoriteQuantity': item.favoriteQuantity,
       // 'favoriteSize': item.favoriteSize,
        //'favoriteRate': item.favoriteRate,
       // 'favoritePrice': item.favoritePrice,
        "favoriteId": item.favoriteId,
        'productDescription': item.productDescription,
        "fpetSex": item.fpetSex,
        "fpetAge": item.fpetAge,
        "fpetBreed": item.fpetBreed,
        "fpetLocation": item.fpetLocation,
        "fpetNum": item.fpetNum,
      };
}
