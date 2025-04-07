import 'package:chef/feature/authentication/controllers/signup/signup.dart';
import 'package:chef/utils/constants/sizes.dart';
import 'package:chef/utils/validators/validate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FormSignUpWidget extends StatelessWidget {
  const FormSignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SignUpController());

    return Form(
      key: controller.signUpFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // firstName
          TextFormField(
            controller: controller.firstName,
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.user),
              labelText: 'firstName'.tr,
            ),
            validator:
                (value) => Validator.validateEmptyText('firstName'.tr, value),
          ),
          SizedBox(height: MySizes.spaceBtwFieldFields),
          // LastName
          TextFormField(
            controller: controller.lastName,
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.user),
              labelText: 'lastName'.tr,
            ),
            validator:
                (value) => Validator.validateEmptyText('lastName'.tr, value),
          ),
          SizedBox(height: MySizes.spaceBtwFieldFields),
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
          Obx(() => TextFormField(
              controller: controller.password,
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.lock),
                suffixIcon: IconButton(
                  onPressed: () => controller.hiddenPassword.toggle(),
                  icon:
                      controller.hiddenPassword.value
                          ? Icon(Iconsax.eye_slash)
                          : Icon(Iconsax.eye),
                ),
                labelText: 'password'.tr,
              ),
              obscureText: controller.hiddenPassword.value,
              validator: (value) => Validator.validatePassword(value),
            ),
          ),

          SizedBox(height: MySizes.spaceBtwSection),
          Obx(
            () => controller.isLoading.value ? Center(child: CircularProgressIndicator()) : SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.signUp(
                    firstName: controller.firstName.text,
                    lastName: controller.lastName.text,
                    email: controller.email.text,
                    password: controller.password.text,
                  );
                },
                child: Text('signUp'.tr),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
