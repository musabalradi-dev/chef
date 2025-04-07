import 'package:get/get.dart';

class Validator{

  static String? validateEmptyText(String? fieldName, String? value){
    if(value == null || value.isEmpty){
      return '$fieldName${'required'.tr}';
    }
    return null;
  }

  static String? validateEmail(String? value){
    if(value == null || value.isEmpty){
      return 'emailRequired'.tr;
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if(!emailRegExp.hasMatch(value)){
      return 'invalidEmail'.tr;
    }

    return null;
  }

  static String? validatePassword(String? value){
    if(value == null || value.isEmpty){
      return 'passwordRequired'.tr;
    }

    if(value.length < 8){
      return 'passwordLength'.tr;
    }

    return null;
  }
}