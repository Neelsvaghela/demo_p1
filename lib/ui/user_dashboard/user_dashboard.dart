import 'package:flutter/material.dart';
import 'package:insurance_project/utils/colorsconstants.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(child: Text("aaa"))
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/policy.png',height: 50,width: 50,),
              MaterialButton(
                color: ColorsConstants.themeColor,
                onPressed: (){

              },child: Text("My Policy"),)
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){}),
    );
  }
}
