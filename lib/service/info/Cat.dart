import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:homepage/Constant.dart';
//import 'package:size_config/size_config.dart';
class Cat extends StatelessWidget {
  const Cat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        debugPrint('Add to cart');
      },
          label:  Text(
              'Contact Store',
            style: GoogleFonts.rubik(color: Color(0xFFC58940))
          ),
        icon: Icon(Icons.call, color: Color(0xFFC58940),),
        backgroundColor: Color(0xFF434242),
        extendedPadding: EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/Store/Meow.jpg',
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,

                  ),

                  //White circular border

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(42),
                          topRight: Radius.circular(42),
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ),

                  //Arrow mark
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 50,
                        left: 25,
                      ),
                      child: GestureDetector(
                        onTap: (){
                        debugPrint('tapped');
                        },
                        child:Icon(Icons.arrow_back),
                      ),

                    ),
                  )
                ],
              ),
            ),


            // Marley Location and Like icons

            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 30
              ),
              transform: Matrix4.translationValues(0, -10, 0),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('KA PERSIAN CATTERY', style: GoogleFonts.rubik(fontSize: 27, color: Color(0xff646379) ),),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined,color: Colors.grey,size: 20,),

                          SizedBox(width: 4,),

                          Text('kerala',style: GoogleFonts.rubik(fontSize: 12,color : Colors.grey),),
                        ],
                      ),
                    ],
                  ),

                  GestureDetector(
                    onTap: (){
                      debugPrint('Favorite');
                    },
                      child: Icon(Icons.favorite_border,color: Colors.pinkAccent,size: 30,)
                  )

                ],
              ),
            ),
            
            
            //3 boxes
            
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(
              horizontal: 30,
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
                      color: Color(0xFF434242),
                    ),
                    width: 100,
                    height: 50,
                    child: Column(
                      children: [
                        Text('Since',overflow: TextOverflow.ellipsis, maxLines: 1, style: GoogleFonts.rubik(fontSize: 17,color: Color(0xFFC58940) )),
                        Text('2000', style: GoogleFonts.rubik(fontSize: 11,color: Colors.grey))
                      ],
                    ),
                  ),

                  Container(
                    padding:const EdgeInsets.symmetric(
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFF434242),
                    ),
                    width: 100,
                    height: 50,
                    child: Column(
                      children: [
                        Text('Rating',overflow: TextOverflow.ellipsis, maxLines: 1, style: GoogleFonts.rubik(fontSize: 17,color: Color(0xFFC58940) )),
                        Text('4.5', style: GoogleFonts.rubik(fontSize: 11,color: Colors.grey))
                      ],
                    ),
                  ),

                  Container(
                    padding:const EdgeInsets.symmetric(
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFF434242),
                    ),
                    width: 100,
                    height: 50,
                    child: Column(
                      children: [
                        Text('Pets',overflow: TextOverflow.ellipsis, maxLines: 1, style: GoogleFonts.rubik(fontSize: 17,color: Color(0xFFC58940) )),
                        Text('Cats Only', style: GoogleFonts.rubik(fontSize: 11,color: Colors.grey))
                      ],
                    ),
                  )
                ],
              ),
            ),


            // About dog and Texts

            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30,),
              child: Text('About Store',style: GoogleFonts.rubik(fontSize: 14,color: Colors.grey)),
            ),

            const SizedBox(height: 5,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30,),
              child: Text("Yes we have persian cats sales kittens and adult in all types extreme also available and doll faces and we must sales only quality cats not cross and our cat prices depends on quality ",

                  style: GoogleFonts.rubik(fontSize: 14,color: Colors.grey[900])),
            ),




            SizedBox(height: 32,),
            Padding(
              padding:const EdgeInsets.symmetric(horizontal: 30,),
              child: Text('Store Pics',style: GoogleFonts.rubik(fontSize: 14,color: Colors.grey)),
            ),




            SizedBox(height: 20,),


            SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return Container(
                      height: 90,
                      width: 180,
                      margin: EdgeInsets.only(
                        left: index == 0 ? 30 :15,
                        right: index == 10 - 1 ? 30 : 0,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/images/Store/Cat.jpg',


                              ),
                          ),

                      ),
                    );
                  },
              ),
            ),

            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
