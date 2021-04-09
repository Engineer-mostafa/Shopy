import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final _formKey = GlobalKey<FormState>();
  final pass = TextEditingController();
  final confPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void closeKeyboard() {
      final  currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

    final mediaQ = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Get.off(LoginScreen()),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: closeKeyboard,
        child: Padding(
          padding: EdgeInsets.only(
              left: mediaQ.width / 18,
              right: mediaQ.width / 18,
              top: mediaQ.height / 100,
              bottom: mediaQ.height / 8),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CustomText(
                      title: "Sign Up,",
                      fontSize: mediaQ.width / 13,
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(
                      height: mediaQ.height / 20,
                    ),
                    CustomTextFormField(
                      title: "Name",
                      hintText: "mostafa",
                      hintStyleColor: Colors.grey,
                      fontSize: mediaQ.width / 25,
                      onSave: (String value) => controller.name = value,
                      onValidator: (String value) {
                        if (value == null || value == "") {
                         return "Enter name please";
                        }

                      },
                    ),
                    SizedBox(
                      height: mediaQ.height / 20,
                    ),
                    CustomTextFormField(
                      title: "Email",
                      hintText: "mos@example.con",
                      hintStyleColor: Colors.grey,
                      fontSize: mediaQ.width / 25,
                      onSave: (String value) => controller.email = value,
                      onValidator: (String value) {
                        if (value == null || value == "") {
                          return "Enter email please";
                        }
                      },
                    ),
                    SizedBox(
                      height: mediaQ.height / 20,
                    ),
                    CustomTextFormField(
                      controller: pass,
                      title: "Password",
                      hintText: "***************",
                      hintStyleColor: Colors.grey,
                      fontSize: mediaQ.width / 25,
                      onSave: (String value) => controller.password = value,
                      onValidator: (String value) {
                        if (value == null || value == "") {
                          return "Enter password please";
                        }

                      },
                      secure: true,
                    ),
                    SizedBox(
                      height: mediaQ.height / 20,
                    ),
                    CustomTextFormField(
                      controller: confPass,
                      title: "Confirm Password",
                      hintText: "***************",
                      hintStyleColor: Colors.grey,
                      fontSize: mediaQ.width / 25,
                      onSave: (String value) => controller.password = value,
                      onValidator: (String value) {
                        if (value == null || value == "") {
                          return "Enter password please";
                        } else if (confPass.text != pass.text) {
                          return "didn't match";
                        }

                      },
                      secure: true,
                    ),
                    SizedBox(
                      height: mediaQ.height / 30,
                    ),
                    CustomButton(
                      title: "Sign Up",
                      padding: mediaQ.height / 70,
                      fontSize: mediaQ.width / 20,
                      borderRadius: mediaQ.width / 80,
                      buttonColor: primaryColor,
                      onpressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          controller.signupWithEmailAndPassword();
                        }
                      },
                    ),
                    SizedBox(
                      height: mediaQ.height / 70,
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
