import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';



import 'info/InoStore.dart';
import 'info/Meow.dart';

class servicepick extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F0ED),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
            Column(

              children: [

                Padding(
                  padding: EdgeInsets.only(top: 0, right: 20, left: 20),
                  child: Text(
                    "Find Your Boarder",
                    style: GoogleFonts.rubik(
                        fontSize: 25,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),

                SizedBox(height: 30,),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 90,
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child:Image.asset('assets/images/Store/Ino.jpg'),
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Fable kennels',
                                    style: TextStyle(fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),

                                  SizedBox(height: 8,),


                                  Text(' Dog boarding, Cat boarding,'),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InoStore()));},
                              icon:Icon(Icons.arrow_forward_ios)),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 90,
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Image.asset('assets/images/Store/Meow.jpg',),
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'KA PERSIAN CATTERY',
                                    style: TextStyle(fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),

                                  SizedBox(height: 8,),


                                  Text('Cats Only'),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Meow()));},
                              icon:Icon(Icons.arrow_forward_ios)),
                        ],
                      ),


                    ],
                  ),
                )

        ]),
      )),
    );
  }
}

