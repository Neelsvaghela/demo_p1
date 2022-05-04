import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRepo{

  void signup(String address,String cnfpassword,String spemail,String username,String contactno)async{
    {
      if(address.isNotEmpty && cnfpassword.isNotEmpty){
        try{
          // final QuerySnapshot result=await FirebaseFirestore.instance.collection("signup_waiting").get();
          // final List<DocumentSnapshot> document=result.docs;
          // if(document.length==0){
          if(!(spemail.isEmpty) && !(username.isEmpty && !(address.isEmpty))){
            FirebaseFirestore.instance.collection("signedUp").doc(spemail).set({
              "Email":spemail,
              "name":username,
              "address":address,
              "contact_no":contactno,
              "password":cnfpassword,
            });
            print("success");
          }else{
            print("failed");
          }
        }catch(error){
          print("failed : ${error}");
        }
      }else{
        print("failed");
      }
    }
  }

Future<User?> signIn(String email,String password) async {
  if(email!=null && password!=null){
    try{
      UserCredential useCred=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email.trim(),
            password: password.trim()
        );
        print(userCredential);

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
      User? user = FirebaseAuth.instance.currentUser;

      // final QuerySnapshot result=await FirebaseFirestore.instance.collection("users").where("id",isEqualTo: user?.uid).get();
      // final List<DocumentSnapshot> document=result.docs;

      return user;
    }catch(error){
      print(error);
    }
  }else{
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text("Fields should not be Empty"),
    // ));
    return null;
  }
}

}