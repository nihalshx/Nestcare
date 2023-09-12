import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../components/custom_button.dart';
import '../../repos/provider/auth_provider.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({ Key? key}) : super(key: key);


  @override
  State<ForgotPassword> createState() => _LoginPageState();


}

class _LoginPageState extends State<ForgotPassword> {

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final _emailcontroller= TextEditingController();


  void dispose(){
    _emailcontroller.dispose();
    super.dispose();
  }
  Future passwordreset() async{
    try{
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailcontroller.text.trim());

      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text("Password reset Link send! Check your email"),
        );

      });

    }on FirebaseAuthException catch (e){
      print(e);

      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );

      });
    }
  }

  @override

  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffF3F0ED),
      body: SafeArea(
        //Nest care

            child:Column(
            children: [

              SizedBox(height:10),

              const Image(
                height:450,
                image: AssetImage(
                  "assets/p2.png",
                ),
              ),



              SizedBox(height: 4),

              //Get Started
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment(-0.69, 0),
                    child:Text(
                        'Forgot',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.bold,
                          fontSize: 33,
                        )
                    ),
                  ),

                  SizedBox(height: 0,),
                  Container(
                    alignment: Alignment(-0.6, 0),
                    child: Text(
                        'Password ?',
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.bold,
                          fontSize: 33,
                        )
                    ),
                  ),

                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment(-0.5, 0),
                    child:Text(
                        'Don’t worry! it happens.Please enter the ',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.inter(
                            color: Color(0xff413F42),
                          fontSize: 14,
                        )
                    ),
                  ),

                  Container(
                    alignment: Alignment(-0.53, 0),
                    child:Text(
                            'address associated with your account.',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.inter(
                          color: Color(0xff413F42
                          ),
                          fontSize: 14,
                        )
                    ),
                  ),
                ],
              ),




              //email

              SizedBox(height: 30,),
            Container(
              width: 310, height: 80,
              child: TextFormField(
                controller: _emailcontroller,


                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),

                    filled: true,
                    hintStyle: GoogleFonts.rubik(color: Colors.grey[400]),
                    hintText: "Email",
                    fillColor: Colors.white70
                ),
              ),
            ),

              SizedBox(height: 0),




              //submit button

              Center(
                child: CustomButton(
                  buttonText: authProvider.isLoginLoadding == false
                      ? const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  )
                      : const Center(child: CircularProgressIndicator()),
                  onpressed: () async {
                    passwordreset();
                  },
                ),
              ),




            ]),
      ),
    );
  }
}
