

import 'package:Nestcare/drawer/feedback.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../chatbot/chart_screen.dart';

import 'DrawerItem.dart';



class Navigation_Drawer extends StatelessWidget {



   Navigation_Drawer({Key? key, }) : super(key: key);




  void signuserout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final user=FirebaseAuth.instance.currentUser;
    return Drawer(
      child: Material(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(height: 40,),
              const Divider(thickness: 1, height: 10, color: Colors.grey,),
              const SizedBox(height: 40,),
              DrawerItem(
                name: 'Chat bot',
                icon: FontAwesomeIcons.robot,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ChatScreen(),));





                },
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Pet Store',
                  icon: Icons.shopping_bag_rounded,
                onPressed: () {
                    launch("https://nestcareshop.mywindo.site");
                },
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Feedback',
                  icon: Icons.feed_rounded,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),));





                },
              ),
              /*const SizedBox(height: 30,),*/
/*              DrawerItem(
                  name: 'Favourites',
                  icon: Icons.favorite_outline,
                  onPressed: ()=> onItemPressed(context, index: 3)
              ),*/
              const SizedBox(height: 30,),
              const Divider(thickness: 1, height: 10, color: Colors.grey,),
              const SizedBox(height: 30,),
/*              DrawerItem(
                  name: 'Setting',
                  icon: Icons.settings,
                  onPressed: ()=> onItemPressed(context, index: 4)
              ),*/
  /*            const SizedBox(height: 30,),*/
              DrawerItem(
                  name: 'Log out',
                  icon: Icons.logout,
                onPressed: () async {
                  signuserout();
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}){
    Navigator.pop(context);

    switch(index){
      case 0:
       // Navigator.push(context, MaterialPageRoute(builder: (context) => const People()));
        break;
    }
  }




  Widget headerWidget() {
    const url = 'https://firebasestorage.googleapis.com/v0/b/nest-care-57f52.appspot.com/o/krista-mangulsone-9gz3wfHr65U-unsplash.jpg?alt=media&token=39ca724b-c34b-4225-a628-4132b39bf980';

    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(url),
        ),
        const SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Name"
                , style: TextStyle(fontSize: 14, color: Colors.white)),
            SizedBox(height: 10,),
            Text('sample@gamil.com', style: TextStyle(fontSize: 14, color: Colors.white))
          ],
        )
      ],
    );

  }
}