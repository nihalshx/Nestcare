import 'package:Nestcare/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../config/routes.dart'as route;
import '../../components/custom_button.dart';
import '../../repos/provider/auth_provider.dart';
import 'ForgotPassword.dart';
import 'auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    return Scaffold(
      backgroundColor: Color(0xffF3F0ED),
     // backgroundColor: Color(0xffF3F0ED),
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
          image: DecorationImage(image: AssetImage("images/lg6.png"), fit: BoxFit.cover)
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[



                SizedBox(height: 50),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                      'Nest Care',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.pacifico(
                        fontWeight: FontWeight.w400,
                        fontSize: 42,
                        color:Colors.black,
                      )
                  ),
                ),
                SizedBox(height: 70),

                //Get Started
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment(-0.85, 0),
                      child:Text(
                          'Get started.',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.rubik(
                            fontWeight: FontWeight.bold,
                            fontSize: 39,
                            color:Colors.black,
                          )
                      ),
                    ),

                    SizedBox(height: 11,),
                    Container(
                      alignment: Alignment(-0.85, 0),
                      child: Text(
                          'sign in to continue',
                          style: GoogleFonts.rubik(
                            fontSize: 19,
                            color:Colors.black,
                          )
                      ),
                    ),
                  ],
                ),
                  SizedBox(height: 25,),


                /// email
                  Center(
                    child: Container(
                      width: 319, height: 80,
                      child: TextFormField(
                        controller:  authProvider.loginUserEmail,

                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(9),
                            ),

                            filled: true,
                            hintStyle: GoogleFonts.rubik(color: Colors.grey[700]),
                            hintText: "Enter email",
                            fillColor: Colors.white
                        ),
                      ),
                    ),
                  ),


                 /* const Text(

                    "Login",
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextField(
                      controller: authProvider.loginUserEmail, title: "Email"),
                  const SizedBox(
                    height: 20,
                  ),
*/
                        /// PASSWORD
                  Center(
                    child: Container(
                      width: 319, height: 65,
                      child: TextFormField(
                          controller:  authProvider.loginUserPassword,

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
                          obscureText: _obscureText
                      ),
                    ),
                  ),


/*
                  TextField(
                    obscureText: _obscureText,
                    controller: authProvider.loginUserPassword,
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




                  Container(
                      alignment: Alignment(0.900, 0),
                      child:TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>  ForgotPassword(),));





                        }, child:  Text(
                        'Recovery Password',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.rubik(
                          color:Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,

                        ),
                      ),)
                  ),


                //button


                  Center(
                    child: CustomButton(
                      buttonText: authProvider.isLoginLoadding == false
                          ? const Text(
                              "Log in",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            )
                          : const Center(child: CircularProgressIndicator()),
                      onpressed: () async {
                        await authProvider.loginValidator(context);
                      },
                    ),
                  ),


                  //or
                  SizedBox(height: 25,),
                  Center(
                    child: Text(
                      '------or------',
                      style: TextStyle( color: Colors.black,fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 25,),

                  //continue google
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0 , vertical: 0.0),
                      child: Container(
                        height: 45,
                        width: 319,
                        padding: EdgeInsets.all(9),
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
                                        color: Colors.black,
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

                  SizedBox(height: 25,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don’t have an acoount ?",style: TextStyle( color: Colors.black,fontWeight: FontWeight.w600),),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context,route.signupPage);
                        },
                        child: const Text(
                          "Sign Up",
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
      ),
    );
  }
}
