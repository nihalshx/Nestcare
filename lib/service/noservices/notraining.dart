import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class notraining extends StatelessWidget {
  const notraining({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Container(
        child: Padding(

          padding: EdgeInsets.only(top: 10, right: 20, left: 20),
          child: Column(
            children: [
              Image.network('https://cdn-icons-png.flaticon.com/512/3900/3900358.png', width: 90,),
              Text(
                  'Training',
                  style: GoogleFonts.rubik(
                      fontSize: 40,
                      fontWeight: FontWeight.w500
                  ),
                ),
              SizedBox(height: 200,),
              Padding(
                padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network('https://cdn-icons-png.flaticon.com/512/7642/7642657.png', width: 50,),

                Text(
                  'Sorry, Service not avilable',
                  style: GoogleFonts.rubik(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),
                ),
                  ],
                ) ,
              )
            ],
          ),
        ),
      ),
    );
  }
}