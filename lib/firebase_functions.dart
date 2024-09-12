import 'package:asseignment_flutter/models/taskModel.dart';
import 'package:asseignment_flutter/models/user_model.dart';
import 'package:asseignment_flutter/models/user_model.dart';
import 'package:asseignment_flutter/models/user_model.dart';
import 'package:asseignment_flutter/models/user_model.dart';
import 'package:asseignment_flutter/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getCollection() {
    return FirebaseFirestore.instance
        .collection('Tasks')
        .withConverter<TaskModel>(fromFirestore: (snapshot, _) {
      return TaskModel.fromJson(snapshot.data()!);
    }, toFirestore: (TaskModel, _) {
      return TaskModel.toJson();
    });
  }

  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection('Users')
        .withConverter<UserModel>(fromFirestore: (snapshot, _) {
      return UserModel.fromJson(snapshot.data()!);
    }, toFirestore: (UserModel, _) {
      return UserModel.toJson();
    });
  }
 static Future<void> addUser(UserModel userModel){
    var collection = getUserCollection();
   var docRef= collection.doc(userModel.id);
    return docRef.set(userModel);
}
  static addTask(TaskModel model) {
    var collection = getCollection();
    var docRef = collection.doc();
    model.id = docRef.id;
    docRef.set(model);
  }

  static Stream<QuerySnapshot<TaskModel>> getTask(DateTime date){
    var collection = getCollection();
    return collection.where('userId',isEqualTo: FirebaseAuth.instance.currentUser!.uid).
    where('date',isEqualTo: DateUtils.dateOnly(date).microsecondsSinceEpoch).snapshots();
  }

  static Future<void> deleteTask(String id){
  return getCollection().doc(id).delete();
}

  static Future<void> updateTask(TaskModel model){
    return getCollection().doc(model.id).update(model.toJson());
}

static createAccountAuth(String emailAddress,String password,{required Function onSuccess, required Function onError,required String userName,required String phone })async{
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    credential.user?.emailVerified;
    UserModel userModel = UserModel(userName: userName, email: emailAddress, phone: phone,id:credential.user!.uid );
    addUser(userModel);
    onSuccess();
  } on FirebaseAuthException catch (e) {
    onError(e.message);
  } catch (e) {
   onError(e.toString());
  }
}

static signInAuth(String emailAddress,String password,
    {required Function onSuccess, required Function onError})async{
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password
    );
      onSuccess(credential.user?.displayName);
  } on FirebaseAuthException catch (e) {
    onError(e.message);
  }catch(e){
    onError(e.toString());
  }
}
static Future<UserModel?> readUser()async{
  DocumentSnapshot<UserModel> docRef=await getUserCollection().doc(FirebaseAuth.instance.currentUser!.uid).get();
  return docRef.data();
}

}
