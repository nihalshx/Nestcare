import 'package:carousel_slider/carousel_slider.dart';
import 'package:Nestcare/config/colors.dart';

import 'package:Nestcare/repos/model/favorite_model.dart';
import 'package:Nestcare/repos/model/pet_model.dart';

import 'package:Nestcare/repos/provider/pet_provider.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailsPage extends StatefulWidget {
  final PetModel petModel;

  const DetailsPage({Key? key, required this.petModel}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int currentIndex = 0;
  bool descTextShowFlag = false;
  int isSelectColor = 0;
  int isSelectSize = 0;

  @override
  Widget build(BuildContext context) {
    PetProvider petProvider = Provider.of(context);

    return Scaffold(
      bottomNavigationBar: SizedBox(

        height: 77,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [

 /*             Expanded(
                child: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      CartModel cartModel = CartModel(
                       // cartColor: productColor!,
                        cartImage: widget.petModel.petImages[0],
                        cartName: widget.petModel.petName,
                        //cartPrice: widget.petModel.petPrice,
                      //  cartSize: productSize!,
                        cartQuantity: 1,
                        cartId: widget.petModel.petId,
                      );
                      petProvider.addToCart(cartModel);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CartPage()));
                    },
                    style: ElevatedButton.styleFrom(),
                    child: const Text(
                      "ADD TO CART",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),*/
              Expanded(
                child: SizedBox(
                  height: 60,
                    child: ElevatedButton.icon( icon: Icon(Icons.favorite_rounded), label:  Text("Add to Favorite",
                        style: GoogleFonts.rubik(color: Colors.white)), onPressed: () {
                      FavoriteModel favoriteModel = FavoriteModel(
                        //favoriteRate: widget.petModel.petRate,
                        favoriteImage: widget.petModel.petImages,
                        favoriteName: widget.petModel.petName,
                        favoriteQuantity: 1,
                        favoriteId: widget.petModel.petId,
                        fpetSex: widget.petModel.petSex,
                        fpetAge: widget.petModel.petAge,
                        fpetBreed: widget.petModel.petBreed,
                        fpetLocation:widget.petModel.petLocation,
                        fpetNum: widget.petModel.petNum,

                        productDescription:
                        widget.petModel.petDescription,
                      );
                      petProvider.addToFavorite(favoriteModel);
                     /* Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>const  FavoritePage()));*/


                    },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        elevation: 0,

                      ),
                    )
                ),
              )
            ],
          ),
        ),
      ),

      //app bar


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
/*        actions: [
          Image.asset("assets/.png"),
          const SizedBox(
            width: 20,
          ),
        ],*/
      ),



      // body starting




      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    CarouselSlider(
                      options: CarouselOptions(
                          autoPlay: true,
                          reverse: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          }
                          // autoPlay: false,
                          ),
                      items: widget.petModel.petImages
                          .map((item) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Image.network(
                                  item,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ))
                          .toList(),
                    ),

                    Transform.translate(
                      offset: const Offset(0, -30),
                      child: AnimatedSmoothIndicator(
                        activeIndex: currentIndex,
                        count: widget.petModel.petImages.length,
                        effect: const WormEffect(
                          spacing: 8.0,
                          dotWidth: 10,
                          dotHeight: 10,
                          paintStyle: PaintingStyle.stroke,
                        ),
                      ),
                    ),
                  ],
                ),
              ),




              const SizedBox(
                height: 30,
              ),








              // Location and name

              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 4
                ),
                transform: Matrix4.translationValues(0, -14, 0),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text(
                        widget.petModel.petName,
                          style: GoogleFonts.roboto(fontSize: 27, ),
                      ),


                        //location

                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,color: Colors.grey,size: 20,),

                            SizedBox(width: 3,),

                            Text(widget.petModel.petLocation,
                              style: GoogleFonts.rubik(fontSize: 14,),
                              ),
                          ],
                        ),
                      ],
                    ),

                  ],
                ),
              ),








             // const Divider(),



              // product like





              const SizedBox(
                height: 10,
              ),


              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 3,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [



                    Container(
                      padding:const EdgeInsets.symmetric(
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black,



                      ),
                      width: 100,
                      height: 50,
                      child: Column(
                        children: [
                          Text(
                            widget.petModel.petBreed,

                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.rubik(fontSize: 16,color: Colors.white,  )
                          ),
                          Text('Breed',
                              style: GoogleFonts.rubik(fontSize: 13,color:Colors.white)
                          )
                        ],
                      ),
                    ),




                    Container(
                      padding:const EdgeInsets.symmetric(
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black,
                      ),
                      width: 100,
                      height: 50,
                      child: Column(
                        children: [
                          Text(
                              widget.petModel.petSex,
                            overflow: TextOverflow.ellipsis, maxLines: 1,
                              style: GoogleFonts.rubik(fontSize: 16,color: Colors.white )
                          ),
                          Text('Sex',
                              style: GoogleFonts.rubik(fontSize: 13,color:Colors.white)
                          )
                        ],
                      ),
                    ),




                    Container(
                      padding:const EdgeInsets.symmetric(
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                          color: Colors.black,
                      ),
                      width: 100,
                      height: 50,
                      child: Column(
                        children: [
                          Text(
                              widget.petModel.petAge,
                            overflow: TextOverflow.ellipsis, maxLines: 1,
                              style: GoogleFonts.rubik(fontSize: 16,color: Colors.white )
                          ),
                          Text('Age',
                              style: GoogleFonts.rubik(fontSize: 13,color: Colors.white)
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),


              const SizedBox(
                height: 35,
              ),






              // phone

              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 4
                ),
                transform: Matrix4.translationValues(0, -6, 0),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                        //location

                        Row(
                          children: [
                            Icon(Icons.phone,color: Colors.black,),

                            SizedBox(width: 8,),

                            Text(widget.petModel.petNum.toString(),
                              style: GoogleFonts.rubik(fontSize: 16,),
                            ),
                          ],
                        ),
                      ],


                ),
              ),











              const Divider(),



              const SizedBox(
                height: 10,
              ),

              // description
              const Text(
                "Description",
                style: TextStyle(
                  fontSize: 19
                ),
              ),



              const SizedBox(
                height: 10,
              ),


              Text(
                widget.petModel.petDescription,

                maxLines: descTextShowFlag ? 8 : 8,
                textAlign: TextAlign.start,
                  style: GoogleFonts.rubik(fontSize: 15,color: Colors.grey[700]),
              ),


              InkWell(
                onTap: () {
                  setState(() {
                    descTextShowFlag = !descTextShowFlag;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    descTextShowFlag
                        ? Text(
                            "Less",
                            style: TextStyle(color: kPrimeryColor),
                          )
                        : Text("More", style: TextStyle(color: kPrimeryColor))
                  ],
                ),
              ),
              const Divider(),



            ],
          ),
        ),
      ),
    );
  }
}
