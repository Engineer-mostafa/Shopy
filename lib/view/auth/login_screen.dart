//Packages
import 'package:e_commerce/view/auth/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//widgets
import '../../Constants.dart';

//controller
import '../../core/view_model/auth_view_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_button_social.dart';

//screens
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  /*this is like id that uniquely identify the form or widgets*/
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    void closeKeyboard(){
      final  currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }
    final mediaQ = MediaQuery
        .of(context)
        .size;
    return Scaffold(

      body: GestureDetector(
        onTap: closeKeyboard,
        child: Padding(
          padding:  EdgeInsets.only(
            left: mediaQ.width/18,
            right: mediaQ.width/18,
            top: mediaQ.height/7,
            bottom: mediaQ.height/8
          ),
          child:
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          title: "Welcome",
                          fontSize: mediaQ.width / 13,
                        ),
                        GestureDetector(
                          onTap: ()=>Get.to(RegisterView()),
                          child: CustomText(
                            title: "SignUp",
                            color: primaryColor,
                            fontSize: mediaQ.width / 22,
                          ),
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
                      onSave: (String value) => controller.email = value
                      ,
                      onValidator: (String value) {
                        if(value == null || value == "") {
                          return "Enter email please";
                        }


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
                      onSave: (String value) =>  controller.password = value,
                      onValidator: (String value) {
                        if(value == null || value == "") {
                          return "Enter password please";
                        }

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
                          return controller.signInWithEmailAndPassword();
                        }
                      },
                    ),
                    SizedBox(
                      height: mediaQ.height / 70,
                    ),
                    CustomText(
                      title: "-OR-",
                      fontSize: mediaQ.width/20,
                    ),
                    SizedBox(
                      height: mediaQ.height / 35,
                    ),
                    CustomButtonSocial(
                      text: "Sign In With Google",
                      imageName: 'assets/images/gg.png',
                      onPress: ()=> controller.googleSignInMethod(),
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
                      onPress: ()=> controller.facebookSignInMethod(),
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
      ),
    );
  }
}
