

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Nestcare/repos/model/user_model.dart';
import 'package:Nestcare/screens/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

class AuthProvider with ChangeNotifier {
  bool isLoginLoadding = false;
  bool isSignupLoadding = false;

  TextEditingController signupUserName = TextEditingController();
  TextEditingController signupUserEmail = TextEditingController();
  TextEditingController signupUserPassword = TextEditingController();
  TextEditingController loginUserEmail = TextEditingController();
  TextEditingController loginUserPassword = TextEditingController();
  RegExp regExp = RegExp(p);


  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  handleLogin(context) async {
    isLoginLoadding = true;
    notifyListeners();
    try{
      UserCredential result = await auth.signInWithEmailAndPassword(email: loginUserEmail.text, password: loginUserPassword.text);
      final  User user = result.user!;
      if (user.uid != null){
        isLoginLoadding = false;
        notifyListeners();
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const
        HomePage(),));

    }
    }on FirebaseAuthException catch (error){
      isLoginLoadding = false;
      notifyListeners();
      if(error.code =="user-not-found"){
        Fluttertoast.showToast(msg: "No user found for that email");
    }
      else if (error.code =="wrong-password"){
    Fluttertoast.showToast(msg: "No user found for that email");
    }
    }
  }

  loginValidator(context) {
    if (loginUserEmail.text.isEmpty && loginUserPassword.text.isEmpty) {
      Fluttertoast.showToast(msg: "email and password is empty");
    } else if (loginUserEmail.text.isEmpty) {
      Fluttertoast.showToast(msg: "email is empty");
    } else if (!regExp.hasMatch(loginUserEmail.text)) {
      Fluttertoast.showToast(msg: "vaild email");
    } else if (loginUserPassword.text.isEmpty) {
      Fluttertoast.showToast(msg: "password is empty");
    } else {
      handleLogin(context);

    }
  }

  handleSignUp(context) async {
    isSignupLoadding = true;
    notifyListeners();
    try{
      UserCredential result = await auth.createUserWithEmailAndPassword(email: signupUserEmail.text, password: signupUserPassword.text);
      final  User user = result.user!;
      if (user.uid != null){
        isSignupLoadding = false;
        notifyListeners();
        sendUsersInFirebase(context);

      }
    }on FirebaseAuthException catch (error){
      isSignupLoadding = false;
      notifyListeners();
      if(error.code =="weak-password"){
        Fluttertoast.showToast(msg: "Password is too weak");
      }
      else if (error.code =="email-already-in-use"){
        Fluttertoast.showToast(msg: "The Account already exists for that email");
      }
    }
  }

  signUpValidator(context) {
    if (signupUserEmail.text.isEmpty &&
        signupUserPassword.text.isEmpty &&
        signupUserName.text.isEmpty) {
      Fluttertoast.showToast(msg: "all field is empty");
    } else if (signupUserName.text.isEmpty) {
      Fluttertoast.showToast(msg: "name is empty");
    } else if (signupUserEmail.text.isEmpty) {
      Fluttertoast.showToast(msg: "email is empty");
    } else if (!regExp.hasMatch(signupUserEmail.text)) {
      Fluttertoast.showToast(msg: "vaild email");
    } else if (signupUserPassword.text.isEmpty) {
      Fluttertoast.showToast(msg: "password is empty");
    } else {
      handleSignUp(context);

    }
  }

 Future sendUsersInFirebase(context) async{
    UserModel userModel = UserModel(
        userName: signupUserName.text,
        userEmail: signupUserEmail.text,
        userId: auth.currentUser!.uid,
        userPassword: signupUserPassword.text);
    try{
      await db.collection("Users").doc(auth.currentUser!.uid).set(userModel.toJson()).then((value) =>
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const
          HomePage(),)) );
    }catch (error){
      isSignupLoadding= false;
      notifyListeners();
      Fluttertoast.showToast(msg: error.toString());
    }
  }

}
