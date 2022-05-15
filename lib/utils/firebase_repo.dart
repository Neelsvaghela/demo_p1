import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRepo{

  Future<UserCredential?> signup(String address,String cnfpassword,String spemail,String username,String contactno)async{
    {
      UserCredential useCred;
      if(address.isNotEmpty && cnfpassword.isNotEmpty){
        try{
          // ignore: prefer_is_not_empty
          if(!(spemail.isEmpty) && !(username.isEmpty && !(address.isEmpty))){
            useCred = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: spemail, password: cnfpassword).then((value) {
              FirebaseFirestore.instance.collection("signedUp").doc(spemail).set({
                "Email":value.user?.email.toString(),
                "name":value.user?.displayName.toString(),
                "address":address,
                "contact_no":contactno,
                "password":cnfpassword,
              });
              return value;
            });
            print("success");
            return useCred;
          }else{
            return null;
          }
        }catch(error){
          print("failed : ${error}");
        }
      }else{
        return null;
      }
    }
  }

  Future<User?> signIn(String email,String password) async {
  if(email!=null && password!=null){
    try{
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email.trim(),
            password: password.trim()
        );
        print(userCredential);
        return userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //   content: Text("No user found for that email."),
          // ));
          return null;
        } else if (e.code == 'wrong-password') {
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //   content: Text( "Wrong password provided for that user."),
          // ));
          return null;
        }
    }
  }else{
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text("Fields should not be Empty"),
    // ));
    return null;
  }
}

}