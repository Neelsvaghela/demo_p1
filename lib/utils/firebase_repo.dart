import 'package:cloud_firestore/cloud_firestore.dart';

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

          }else{

          }
        }catch(error){}
      }else{

      }
    }
  }



}