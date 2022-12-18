

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp2/presentation/navbar/navbar.dart';
import 'package:fyp2/presentation/navbar_serviceprovider/navbar_serviceprovider.dart';
import 'package:fyp2/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthController extends GetxController{
  //AuthController.intsance..
  static AuthController instance = Get.find();
  //email, password, name...
  late Rx<User?> _user;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;


  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //our user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user){
    firestore.collection('customers').doc(user!.uid).get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists){
        Get.offAndToNamed(AppRoutes.navbarcustomer);
      }
      else{
        Get.offAndToNamed(AppRoutes.navbarserviceprovider);
    }});

  }




  void register(String email, password)async{
    try{
      await  auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Account creation failed",
            style: TextStyle(
                color: Colors.white
            ),
          ),
          messageText: Text(
              e.toString(),
              style: TextStyle(
                  color: Colors.white
              )
          )
      );
    }
  }

  void login(String email, password)async{
    try{
      await  auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Login failed",
            style: TextStyle(
                color: Colors.white
            ),
          ),
          messageText: Text(
              e.toString(),
              style: TextStyle(
                  color: Colors.white
              )
          )
      );
    }
  }

  Future<String> signUpUsers(
      String fullName, String email, String password, String address, String mobile) async {
    String res = "some error occured";
    try {
      if (fullName.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          address.isNotEmpty) {
        UserCredential cred = await auth.createUserWithEmailAndPassword(
            email: email, password: password);

        await firestore.collection('users').doc(cred.user!.uid).set({
          "uid": cred.user!.uid,
          "name": fullName,
          "email": email,
          "address": address,
          "mobile": mobile,
        });

        res = "Success";
        print("Account Created!");
      } else {
        res = "Fields should not be empty!";
        print("Account Not Created! Fields Empty.");
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  void logOut()async{
    await auth.signOut();
  }
}