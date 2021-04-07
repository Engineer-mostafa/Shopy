

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController{
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
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

  void googleSignInMethod()async{
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
    await _auth.signInWithCredential(googleCredential);
  }
  void facebookSignInMethod()async{
    /*just to open facebook form and choose email*/
    FacebookLoginResult result =  await _facebookLogin.logIn(['email']);

    /*get accessToken from facebook*/
    final accessToken = result.accessToken.token;


    /*check if user loggedin or not and then signin with facebook credential*/
    if(result.status == FacebookLoginStatus.loggedIn){
      final faceCredential = FacebookAuthProvider.credential(accessToken);
      await _auth.signInWithCredential(faceCredential);

    }

  }

  /*signOut google*/
  void signOutFromGoogle()async{
    await _googleSignIn.signOut();
  }

}