import 'package:chef/localization/arabic.dart';
import 'package:chef/localization/english.dart';
import 'package:get/get.dart';

class Languages extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    'en':english,
    'ar':arabic,
  };

}