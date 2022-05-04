import 'package:flutter/material.dart';
import 'package:insurance_project/ui/user_dashboard/user_dashboard.dart';
import 'package:insurance_project/utils/colorsconstants.dart';
import 'package:insurance_project/utils/firebase_repo.dart';

import '../user_register/user_register.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController nameController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();

  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();

  static const String _title = 'Insurance App';

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(_title),
      ),
      body:  Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "User Login",
                    style: TextStyle(
                        color: ColorsConstants.themeColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    '',
                    style: TextStyle(fontSize: 20),
                  )),

              Form(
                key: _formKey,
                  child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      focusNode: nameFocusNode,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'User Name',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      focusNode: passwordFocusNode,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                ],
              )),

              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: const Text('Forgot Password',),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () async{
                      if (!_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Enter Correct Details"))
                        );
                      }else{
                        var result= await FirebaseRepo().signIn(nameController.text, passwordController.text);
                        if(await result !=null){
                          print("success");
                        }else{
                          print("unSuccess");
                        }
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => UserDashboard(),));
                      }
                    },
                  )
              ),
              Row(
                children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      //signup screen
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterScreen()));
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          )),
    ),);
  }

  @override
  void dispose() {
    super.dispose();
  }
}


