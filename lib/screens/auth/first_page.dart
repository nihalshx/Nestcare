
import 'package:Nestcare/components/custom_button.dart';
import 'package:flutter/material.dart';
import '../../config/routes.dart'as route;


class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F0ED),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          bottom: MediaQuery.of(context).padding.bottom,
          left: 24,
          right: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              height:124,
              image: AssetImage(
                "assets/nestcare.png",
              ),
            ),
            const SizedBox(height: 16),
            Text(


              "Let them know someone cares",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,

            ),
            const SizedBox(height: 12),
            const Expanded(
              child: Image(
                image: AssetImage(
                  "assets/p1.png",
                ),
              ),
            ),
            const SizedBox(height: 0),
            Text(
              "just register your account to fulfill the\nbest needs for your beloved pet",
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),
            GestureDetector(
             onTap: () async{
               await Navigator.pushNamed(context,route.signupPage);
              },
              child: Container(

                height: 66,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(32),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Get Started",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color:Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an Account ? ",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextButton(onPressed: () async{
                  Navigator.pushNamed(context,route.loginPage);
                }, child: const Text("Login"))
              ],
            )
          ],
        ),
      ),
    );
  }

}
