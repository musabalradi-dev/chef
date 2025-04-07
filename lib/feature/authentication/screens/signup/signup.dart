import 'package:chef/feature/authentication/screens/signup/widgets/signup_form.dart';
import 'package:chef/feature/authentication/screens/signup/widgets/signup_header.dart';
import 'package:chef/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(MySizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Header Login
                SignUpHeaderWidget(),

                // Form Login
                FormSignUpWidget(),

              ],),
          ),
        ),
      ),
    );
  }
}
