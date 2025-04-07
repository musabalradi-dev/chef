import 'package:chef/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsDialog extends StatelessWidget {
  const AboutUsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Get.theme.cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // App Icon/Logo
            CircleAvatar(
              radius: 40,
              backgroundColor: Get.theme.colorScheme.primary.withValues(alpha: 0.2),
              child: Icon(
                Icons.info_outline,
                size: 40,
                color: MyColors.primary,
              ),
            ),

            const SizedBox(height: 20),

            // Title
            Text(
              'about'.tr,
              style: Get.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Get.theme.colorScheme.primary,
              ),
            ),

            const SizedBox(height: 16),

            // Description
            Text(
              'messageAboutUs'.tr,
              textAlign: TextAlign.center,
              style: Get.textTheme.bodyMedium,
            ),

            const SizedBox(height: 20),

            // Version Info
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'version'.tr,
                  style: Get.textTheme.bodySmall?.copyWith(
                    color: Get.theme.colorScheme.primary,
                  ),
                ),

                Text(
                  ' 1.0.0'.tr,
                  style: Get.textTheme.bodySmall?.copyWith(
                    color: Get.theme.colorScheme.primary,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Close Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                child: Text('close'.tr),
              ),
            ),
          ],
        ),
      ),
    );
  }
}