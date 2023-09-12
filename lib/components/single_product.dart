import 'package:Nestcare/screens/details/details_page.dart';
import 'package:Nestcare/repos/model/pet_model.dart';
import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final PetModel petModel;

  const SingleProduct({Key? key, required this.petModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsPage(petModel: petModel)));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage.assetNetwork(
                image: petModel.petImages[0],
                fit: BoxFit.cover,
                height: 200,
                width: 148,
                placeholder:  "assets/Image.png"
              ),
            ),
            const SizedBox(
              height: 6,
            ),








            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20 / 4),
              child: Text(
                petModel.petName,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Text(
              "\Breed : ${petModel.petBreed}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),

          ],
        ),
      ),
    );
  }
}
