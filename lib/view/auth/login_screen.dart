//Packages
import 'package:flutter/material.dart';

//widgets
import '../../Constants.dart';

//screens
import '../widgets/custom_text.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQ = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Login"),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 50,
        ),
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
              height: mediaQ.height/80,
            ),

            CustomText(
              title: "Sign in to Continue",
              color: Colors.grey,
              fontSize: mediaQ.width / 30,
              alignment: Alignment.topLeft,
            ),
          ],
        ),
      ),
    );
  }
}
