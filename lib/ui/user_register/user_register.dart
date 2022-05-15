import 'package:flutter/material.dart';
import 'package:insurance_project/ui/login_screen/login_screen.dart';
import 'package:insurance_project/utils/colorsconstants.dart';
import 'package:insurance_project/utils/firebase_repo.dart';

import '../user_dashboard/user_dashboard.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  static const String _title = 'User Register';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body:  ListView(
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Insurance App',
                style: TextStyle(
                    color: ColorsConstants.themeColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              )),

          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User Name',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: passwordController,
                keyboardType: TextInputType.text,//ahiya su aave?
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: emailController,
                keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: mobileController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Mobile no',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: address1Controller,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Address 1',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: address2Controller,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Address 2',
              ),
            ),
          ),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Register'),
                onPressed: () async{
                  //signup screen
                  var result= await FirebaseRepo().signup(
                      address1Controller.text.toString()+address2Controller.text.toString(),
                      passwordController.text.toString(),
                      emailController.text.toString(),
                      nameController.text.toString(),
                      mobileController.text.toString()
                  );
                  if(result !=null){
                    print("success");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserDashboard(),));
                  }else{
                    print("unSuccess");
                  }
                },
              )
          ),
          Row(
            children: <Widget>[
              const Text('Already have account?'),
              TextButton(
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                },
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}


