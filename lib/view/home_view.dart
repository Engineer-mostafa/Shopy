



import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: CustomButton(
      title: "Sign Out",
          onpressed: ()=>controller.signOutFromGoogle(),
        ),
      ),
    );
  }
}
