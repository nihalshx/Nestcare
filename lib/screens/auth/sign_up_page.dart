import 'package:Nestcare/components/custom_text_field.dart';
import 'package:Nestcare/repos/provider/auth_provider.dart';
import 'package:Nestcare/screens/auth/auth_services.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../components/custom_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);

    return Scaffold(
      backgroundColor: Color(0xffF3F0ED),

     // backgroundColor: Colors.cyan,
      resizeToAvoidBottomInset: false,
/*      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),*/
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/lg7.png"), fit: BoxFit.cover)
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 0),
                //FadeAnimation(0.5,
/*                Container(
                  alignment: Alignment(-0.6, 0),
                  child: Text(
                      'Nest Care',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.pacifico(
                        fontWeight: FontWeight.w400,
                        fontSize: 26,
                        color: Colors.black,
                      )
                  ),
                ),*/
                SizedBox(height: 140),

                //Get Started


                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child:Text(
                          'Create an account',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.rubik(
                            fontWeight: FontWeight.w600,
                            fontSize: 29,
                            color: Colors.black,
                          )
                      ),
                    ),

                    SizedBox(height: 15,),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                          'Lets go through a few simple steps',
                          style: GoogleFonts.rubik(
                            fontSize: 14,
                            color: Colors.black,
                          )
                      ),
                    ),
                  ],
                ),



                SizedBox(height: 30,),


                Center(
                  child: Container(
                    width: 319, height: 80,
                    child: TextFormField(
                      controller: authProvider.signupUserName,


                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(9),
                          ),

                          filled: true,
                          hintStyle: GoogleFonts.rubik(color: Colors.grey[700]),
                          hintText: "Enter name",
                          fillColor: Colors.white
                      ),
                    ),
                  ),
                ),


/*              CustomTextField(
                    controller: authProvider.signupUserName, title: "Name"),



                const SizedBox(
                  height: 20,
                ),*/





                Center(
                  child: Container(
                    width: 319, height: 80,
                    child: TextFormField(
                      controller: authProvider.signupUserEmail,


                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(9),
                          ),

                          filled: true,
                          hintStyle: GoogleFonts.rubik(color: Colors.grey[700]),
                          hintText: "Enter email ",
                          fillColor: Colors.white
                      ),
                    ),
                  ),
                ),



/*
                CustomTextField(
                    controller: authProvider.signupUserEmail, title: "Email"),



                const SizedBox(
                  height: 20,
                ),
*/


                Center(
                  child: Container(
                    width: 319, height: 80,
                    child: TextFormField(
                        controller:  authProvider.signupUserPassword,

                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(9),
                            ),
                            suffixIcon: IconButton(

                              icon: Icon(_obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              color: Colors.grey[900],
                            ),
                            filled: true,
                            hintStyle: GoogleFonts.rubik(color: Colors.grey[700]),
                            hintText: "Password",
                            //errorText: _PasswordError,
                            fillColor: Colors.white
                        ),
                      obscureText: _obscureText,
                    ),
                  ),
                ),





/*
                TextField(
                  obscureText: _obscureText,
                  controller: authProvider.signupUserPassword,
                  decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )
                  ),
                ),
*/




                const SizedBox(
                  height: 20,
                ),


                Center(
                  child: CustomButton(
                    buttonText: authProvider.isSignupLoadding == false
                        ? const Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 18,
                              // fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          )
                        : const Center(child: CircularProgressIndicator()),
                    onpressed: () async {
                      await authProvider.signUpValidator(context);
                    },
                  ),
                ),



                SizedBox(height: 25,),
                Center(
                  child: Text(
                    '------or------',
                    style: TextStyle( color: Colors.black,fontWeight: FontWeight.w600,
                    fontSize: 14),
                  ),
                ),
                SizedBox(height: 25,),



                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Container(
                      height: 45,
                      width: 319,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: GestureDetector(
                        onTap: () => AuthService().signInWithGoogle(),
                        child: Center(

                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 59.0 , vertical: 0.0),
                              child: Row(
                                children: [
                                  Image.asset("assets/google.png",height: 36,),
                                  Text(
                                    'Continue With Google',
                                    style: GoogleFonts.rubik(
                                      color:  Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an acoount ?",style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                      ,),),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle( color: Color(0xff089BFF),fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
