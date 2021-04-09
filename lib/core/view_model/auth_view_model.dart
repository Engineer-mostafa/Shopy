
//packages
import 'package:e_commerce/view/auth/login_screen.dart';

import '../services/firestore_user.dart';
import '../../model/user_model.dart';
import '../../view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  /*social instances*/
  final _googleSignIn = GoogleSignIn(scopes: ['email']);
  final _facebookLogin = FacebookLogin();

  //firebase instances
  final _auth = FirebaseAuth.instance;

  //locals
  String email, password, name;

  //saved the state of the user if he signedin
  final Rx<User> _user = Rx<User>(null);
  String get user=> _user.value?.email;

  //eye
  bool _eye = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());

  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  /*signin with gmail*/
  Future googleSignInMethod() async {
    try {
      //just to open google form and choose email
      final _googleUser = await _googleSignIn.signIn();
      //get idToken and accessToken from google to pass then into credential
      final googleSignInAuthentication = await _googleUser.authentication;

      //get credential from google to signin in firebase
      final googleCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      // signin in firebase using credential
      await _auth.signInWithCredential(googleCredential).then((user) {


          addUTF(user);
          Get.offAll(HomeView());
      }
      );

    } catch (e) {
    // ignore: empty_catches
    }
  }

  /*signin with password*/
  Future facebookSignInMethod() async {
    try {
      /*just to open facebook form and choose email*/
      final FacebookLoginResult result = await _facebookLogin.logIn(['email']);

      /*get accessToken from facebook*/
      final accessToken = result.accessToken.token;

      /*check if user loggedin or not and then signin with facebook credential*/
      if (result.status == FacebookLoginStatus.loggedIn) {
        final faceCredential = FacebookAuthProvider.credential(accessToken);
        await _auth.signInWithCredential(faceCredential).then((user)=>addUTF(user));;
      }
    } catch (e) {

      Get.snackbar("Error Login account",
        e.message.toString(),
        colorText: Colors.black ,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /*sign in with Email and Password*/
  Future signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(HomeView());
    } catch (e) {
      Get.snackbar("Error Login account",
          e.message.toString(),
          colorText: Colors.black ,
          snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
  /*sign up with Email and Password*/
  Future signupWithEmailAndPassword() async {
    try {
      await _auth.createUserWithEmailAndPassword( email: email,
          password: password).then((user)=>addUTF(user));

      Get.offAll(HomeView());

    } catch (e) {
      Get.snackbar("Error Login account",
          e.message.toString(),
          colorText: Colors.black ,
          snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> addUTF(user) async {
    final us = user.user;
    await FireStoreUser().addUserToFireStore(
        UserModel(userId: us.uid,
            email: us.email,
            name: name,
            picture: us.photoURL));
  }
  /*signOut google*/
  Future signOutFromGoogle() async {
    await _auth.signOut();
    Get.offAll(LoginScreen());
    debugPrint("SignOut");
  }



  /*toggle the eye*/
  bool toggleEye(){
    debugPrint(eye.toString());
      _eye=!_eye;
      update();
      return _eye;
  }
  bool get eye => _eye;
}
