

//packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//controller
import '../core/view_model/auth_view_model.dart';

//Screens
import '../view/auth/login_screen.dart';
import '../view/home_view.dart';




class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return (Get.find<AuthViewModel>().user  != null) ? HomeView(): LoginScreen();
    });
  }
}
