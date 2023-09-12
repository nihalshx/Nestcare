import 'package:carousel_slider/carousel_slider.dart';
import 'package:Nestcare/components/single_product.dart';
import 'package:Nestcare/repos/model/pet_model.dart';
import 'package:Nestcare/repos/provider/category_provider.dart';
import 'package:Nestcare/repos/provider/pet_provider.dart';
import 'package:Nestcare/screens/home/featured_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../components/single_category.dart';
import '../categories/categories_view_all.dart';

class ListContents extends StatefulWidget {
  final PetProvider petProvider;
  const ListContents({
    Key? key,
    required this.petProvider,
  }) : super(key: key);

  @override
  State<ListContents> createState() => _ListContentsState();
}

class _ListContentsState extends State<ListContents> {
  final ads = [
    "assets/ad1.jpg",
    "assets/ad2.jpg",
    "assets/ad3.jpg",
    "assets/ad4.jpg",
    "assets/ad5.jpg",
  ];

   String searchQuery ="";
  @override
  Widget build(BuildContext context) {

List<PetModel> petSeachList = widget.petProvider.search(searchQuery);

        CategoriesProvider categoriesProvider = Provider.of(context);
        categoriesProvider.getCategoriesData();

    return SafeArea(

      
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Center(

            child: Column(
              children: [
                Container(
                  height:105,
                child:Image.asset("assets/nestcare.png"),
                ),

              ],
            ),
          ),


          const SizedBox(height: 3),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration:BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(14)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Container(
                height: 50,
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                        //fillColor: Colors.white,
                        hoverColor: Colors.white,
                        //filled: true,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Search Your Pets",
                        prefixIcon: Image.asset("assets/search.png"),

/*                  enabledBorder:
                            const OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 1))*/
                    ),
                  ),
                ),
              ),
            ),

          if (searchQuery != "" && searchQuery.isNotEmpty) ...{
            petSeachList.isEmpty
                ? SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: const Center(
                      child: Text(
                        "No Data",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : GridView.builder(
                    itemCount: petSeachList.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.63),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          SingleProduct(petModel: petSeachList[index]),
                        ],
                      );
                    },
                  )
          } else ...{



            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),




                SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      viewportFraction: 1,
                      disableCenter: true,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                    ),
                    itemCount: ads.length,
                    itemBuilder: (context, index, realIndex) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image(
                            image: AssetImage(
                              ads[index],
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                  ),
                ),




                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Categories",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const CategoriesViewAll()));
                          },
                          child: const Text(
                            "View all",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),


                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: categoriesProvider.categorysList.map<Widget>((e) => SingleCategory(categoriesModel: e,) ).toList(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Available Pets",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FeaturedPage(
                                      petProvider: widget.petProvider,
                                    )));
                          },
                          child: const Text(
                            "View all",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
                          )),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                      children: widget.petProvider.featuredPetList
                          .map<Widget>((petModel) =>
                              SingleProduct(petModel: petModel))
                          .toList()),
                ),
                const SizedBox(
                  height: 20,
                ),
/*                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Best Sell",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FeaturedPage(
                                      petProvider: widget.petProvider,
                                    )));
                          },
                          child: const Text(
                            "View all",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
                          )),
                    ],
                  ),
                ),*//*
                SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: widget.petProvider.featuredPetList
                            .map<Widget>((petModel) =>
                                SingleProduct(petModel: petModel))
                            .toList()),
                  ),
                ),*/
              ],
            ),
          }
        ],
      ),
    );
  }
}
