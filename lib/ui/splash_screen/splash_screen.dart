
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {//ahiya alt + enter
  static String routeName = "/splashscreen";

  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // ahiya pelo naakh
// aapdse samre to same document jevu kari daiye joiye kevu lage che barobar
  @override
  void initState() {
    super.initState();

    Future.delayed( const Duration(seconds: 3), () =>
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()))  // jo have class ne import kari devani aavi rite
    );
  }


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          body: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 200,),
                Expanded(child: Container(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/appLogo.png',height: 200,width:200,fit: BoxFit.fitWidth,))),
               const Text('Insurance App',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Container(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset('assets/images/splashImage.png')),
              ],
            )
          ),
        ),
      );
  }


  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }
}
