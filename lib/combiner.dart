
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:typicons_flutter/typicons_flutter.dart';
import 'chatbot/chart_screen.dart';



import 'drawer/NavigationDrawer.dart';
import 'navbar/navbar.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

}

class Combiner extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      drawer:     Navigation_Drawer(),
      appBar: buildAppBar( context),
        body: Navbar_page()
    );

  }


  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 4),
            child: Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(399),
            color: Colors.black,
            border: Border.all(color: Colors.black)
                ),


                    child: IconButton(icon: Icon(Typicons.social_flickr),color: Colors.white , onPressed: () => Scaffold.of(context).openDrawer(),
              iconSize: 30,),
            ),
          );
        }
      ),
      backgroundColor:Colors.transparent,
      elevation: 0,


/*      actions: <Widget>[

        IconButton(icon: FaIcon(FontAwesomeIcons.robot),
          color: Colors.black,
          iconSize: 36,




          onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(
              builder: (context) => const ChatScreen(),));





        },)
      ],*/


    );
  }





}


class Body {

}