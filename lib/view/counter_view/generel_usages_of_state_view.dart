import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:sign_in_button/sign_in_button.dart';

class GeneralUsagesOfStateView extends StatelessWidget {
  const GeneralUsagesOfStateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("General Usages of State"),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SignInButton(
              Buttons.google,
              text: "Sign up with Google",

              onPressed: () {
                /// bottom sheet using get-x






                /// bottom sheet using get-x

                // Get.bottomSheet(
                //   Container(
                //
                //     height: 200,
                //     width: double.infinity,
                //     padding: EdgeInsets.all(20),
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.only(
                //         topLeft: Radius.circular(20),
                //         topRight: Radius.circular(20),
                //       ),
                //     ),
                //
                //     child: Text("Hello from bottom sheet"),
                //   ),
                // );

                /// snackbar using get-x
                // Get.snackbar(
                //   backgroundColor: Colors.green,
                //   snackPosition: SnackPosition.BOTTOM,
                //   "Success",
                //   "Product added to cart",
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
