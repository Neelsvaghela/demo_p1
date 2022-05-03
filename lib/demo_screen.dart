import 'package:flutter/material.dart';
// jya
class DemoScreen extends StatefulWidget {//ahiya alt + enter
  static String routeName = "/DemoScreen";

  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Container(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
