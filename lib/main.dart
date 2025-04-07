import 'package:chef/app.dart';
import 'package:chef/utils/dio/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  // todo: WidgetsFlutterBinding
  WidgetsFlutterBinding.ensureInitialized();
  // todo: storage initialization
  await GetStorage.init();
  // todo: dio initialization
  await DioHelper.init();

  runApp(MyApp());
}
