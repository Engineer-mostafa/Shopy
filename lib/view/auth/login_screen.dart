//Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';


//controller
import '../../core/view_model/auth_view_model.dart';


//widgets
import '../../Constants.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_button_social.dart';


//screens
import '../widgets/custom_text.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  /*this is like id that uniquely identify the form or widgets*/
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    void closeKeyboard(){
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }
    final mediaQ = MediaQuery
        .of(context)
        .size;
    return Scaffold(

      body: Padding(
        padding:  EdgeInsets.only(
          left: mediaQ.width/18,
          right: mediaQ.width/18,
          top: mediaQ.height/7,
        ),
        child: 
        GestureDetector(
          onTap: closeKeyboard,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: "Welcome",
                        color: Colors.black,
                        fontSize: mediaQ.width / 13,
                      ),
                      CustomText(
                        title: "SignUp",
                        color: primaryColor,
                        fontSize: mediaQ.width / 22,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: mediaQ.height / 160,
                  ),
                  CustomText(
                    title: "Sign in to Continue",
                    color: Colors.grey,
                    fontSize: mediaQ.width / 30,
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(
                    height: mediaQ.height / 20,
                  ),
                  CustomTextFormField(
                    title: "Email",
                    hintText: "mos@example.con",
                    hintStyleColor: Colors.grey,
                    fontSize: mediaQ.width / 25,
                    onSave: (value) {
                      controller.email = value;
                    },
                    onValidator: (value) {
                      if(value == null || value == "")
                        Get.snackbar("Error Login account",
                        "The email field is empty",
                        colorText: Colors.black ,
                        snackPosition: SnackPosition.BOTTOM,
                          borderRadius: mediaQ.width/25,

                      );
                    },
                  ),
                  SizedBox(
                    height: mediaQ.height / 20,
                  ),
                  CustomTextFormField(
                    title: "Password",
                    hintText: "***************",
                    hintStyleColor: Colors.grey,
                    fontSize: mediaQ.width / 25,
                    onSave: (value) {
                      controller.password = value;
                    },
                    onValidator: (value) {
                      if(value == null || value == "")
                        Get.snackbar("Error Login passowrd",
                          "The passowrd field is empty",
                          colorText: Colors.black ,
                          snackPosition: SnackPosition.BOTTOM,
                          borderRadius: mediaQ.width/25,

                        );
                    },
                    secure: true,
                  ),
                  SizedBox(
                    height: mediaQ.height / 40,
                  ),
                  CustomText(
                    title: "forget password?",
                    fontSize: mediaQ.width / 25,
                    alignment: Alignment.topRight,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: mediaQ.height / 30,
                  ),
                  CustomButton(
                    padding: mediaQ.height / 70,
                    fontSize: mediaQ.width / 20,
                    borderRadius: mediaQ.width / 80,
                    buttonColor: primaryColor,
                    onpressed: (){
                      if(_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        controller.signInWithEmailAndPassword();
                      }

                    },
                  ),
                  SizedBox(
                    height: mediaQ.height / 70,
                  ),
                  CustomText(
                    title: "-OR-",
                  fontSize: mediaQ.width/20,
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: mediaQ.height / 35,
                  ),
                  CustomButtonSocial(
                      text: "Sign In With Google",
                      imageName: 'assets/images/gg.png',
                      onPress: ()=>
                        controller.googleSignInMethod()
                      ,
                    fontSize: mediaQ.width/26,
                    borderRadius: mediaQ.width/50,
                    width: mediaQ.width/4.5,
                  ),
                  SizedBox(
                    height: mediaQ.height / 35,
                  ),
                  CustomButtonSocial(
                    text: "Sign In With Facebook",
                    imageName: 'assets/images/facebook.png',
                    onPress: ()=>controller.facebookSignInMethod(),
                    fontSize: mediaQ.width/26,
                    borderRadius: mediaQ.width/50,
                    width: mediaQ.width/4.5,

                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
