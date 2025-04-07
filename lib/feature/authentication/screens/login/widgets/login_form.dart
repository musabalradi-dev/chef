import 'package:chef/feature/authentication/controllers/login/login.dart';
import 'package:chef/feature/authentication/screens/signup/signup.dart';
import 'package:chef/utils/constants/sizes.dart';
import 'package:chef/utils/validators/validate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FormLoginWidget extends StatelessWidget {
  const FormLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // email
          TextFormField(
            controller: controller.email,
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: 'email'.tr,
            ),
            validator: (value) => Validator.validateEmail(value),
          ),
          SizedBox(height: MySizes.spaceBtwFieldFields),
          // password
          Obx(
            () => TextFormField(
              controller: controller.password,
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.lock),
                suffixIcon: IconButton(
                  onPressed:
                      () =>
                          controller.hidePassword.toggle(),
                  icon:
                      controller.hidePassword.value
                          ? Icon(Iconsax.eye_slash)
                          : Icon(Iconsax.eye),
                ),
                labelText: 'password'.tr,
              ),
              obscureText: controller.hidePassword.value,
              validator: (value) => Validator.validatePassword(value),
            ),
          ),
          SizedBox(height: MySizes.spaceBtwFieldFields / 2),
          Row(
            children: [
              Obx(
                () => Checkbox(
                  value: controller.privacyPolicy.value,
                  onChanged:
                      (value) =>
                          controller.privacyPolicy.value =
                              !controller.privacyPolicy.value,
                ),
              ),
              Text('rememberMe'.tr),
            ],
          ),
          SizedBox(height: MySizes.spaceBtwFieldFields),

          Obx(
            () =>
                controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed:
                                () => controller.login(
                                  email: controller.email.text,
                                  password: controller.password.text,
                                ),
                            child: Text('login'.tr),
                          ),
                        ),
                        SizedBox(height: MySizes.spaceBtwFieldFields),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () => Get.to(() => SignUpScreen()),
                            child: Text('signUp'.tr),
                          ),
                        ),
                      ],
                    ),
          ),
        ],
      ),
    );
  }
}
