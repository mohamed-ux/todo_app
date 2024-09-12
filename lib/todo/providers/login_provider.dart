import 'package:asseignment_flutter/firebase_functions.dart';
import 'package:asseignment_flutter/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier{
  late User? firebaseUser;
  UserModel? userModel;
  LoginProvider(){
    firebaseUser= FirebaseAuth.instance.currentUser;
    if(firebaseUser!= null){
      initUser();
    }
  }
  initUser()async{
    userModel= await FirebaseFunctions.readUser();
    notifyListeners();
  }
}