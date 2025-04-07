import 'package:chef/feature/personalization/screens/about/about.dart';
import 'package:get/get.dart';

class AboutUsController extends GetxController {

  String get appVersion => '1.0.0'; // You can make this dynamic

  void showAboutUs() {
    Get.dialog(const AboutUsDialog());
  }
}