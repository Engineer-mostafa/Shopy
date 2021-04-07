

import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  //dependency injection
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
  }

}