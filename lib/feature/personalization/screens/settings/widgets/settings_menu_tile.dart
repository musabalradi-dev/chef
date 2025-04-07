import 'package:chef/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.onPressed,
  });

  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Icon(icon, size: 28, color: MyColors.primary,),
      title: Text(title.tr, style: Theme.of(context).textTheme.titleMedium,),
      trailing: trailing,
    );
  }
}
