 // ignore_for_file: depend_on_referenced_packages

import 'package:Nestcare/combiner.dart';
import 'package:Nestcare/repos/provider/auth_provider.dart';
import 'package:Nestcare/repos/provider/category_provider.dart';
import 'package:Nestcare/repos/provider/pet_provider.dart';
import 'package:Nestcare/screens/auth/first_page.dart';
import 'package:Nestcare/screens/connectivity/network_aware_widget.dart';
import 'package:Nestcare/screens/connectivity/network_status_service.dart';
import 'package:Nestcare/screens/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'config/routes.dart' as route;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'navbar/navbar.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
       
        ChangeNotifierProvider(
          create: (context) => PetProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoriesProvider(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: route.controller,
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if(!snapshot.hasData){
              return const FirstPage();
            }
            else{
              return Combiner();
            }
          },
        ),
      ),
    );
  }
}
