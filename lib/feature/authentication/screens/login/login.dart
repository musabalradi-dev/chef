import 'package:chef/common/styles/spacing_styles.dart';
import 'package:chef/feature/authentication/screens/login/widgets/login_form.dart';
import 'package:chef/feature/authentication/screens/login/widgets/login_header.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyles.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Header Login
              LoginHeaderWidget(),

              // Form Login
              FormLoginWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
