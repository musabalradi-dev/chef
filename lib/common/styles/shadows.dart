import 'package:chef/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class ShadowStyle{
  ShadowStyle._();

  static final verticalProductShadow = BoxShadow(
    color: MyColors.darkGrey.withValues(alpha: 0.1),
    blurRadius: 50,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: MyColors.darkGrey.withValues(alpha: 0.1),
    blurRadius: 50,
    offset: const Offset(0, 2),
  );

}