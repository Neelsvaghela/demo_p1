import 'package:firebase_core/firebase_core.dart';
import 'package:insurance_project/ui/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:insurance_project/utils/colorsconstants.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Future.delayed( const Duration(seconds: 2),
         () => runApp(const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: ColorsConstants.themeColor,
      ),
      home: SplashScreen(),
    );
  }
}


