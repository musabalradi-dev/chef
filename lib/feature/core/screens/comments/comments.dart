import 'package:chef/feature/core/controllers/comments/comments.dart';
import 'package:chef/feature/core/screens/comments/widgets/comment_dialog.dart';
import 'package:chef/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CommentsController());
    return Scaffold(
      appBar: AppBar(
          title: Text(controller.restaurantName.value),
      actions: [
            IconButton(
              icon: const Icon(Icons.add_comment),
              onPressed: () => Get.dialog(CommentDialog()),
            ),
          ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(MySizes.defaultSpace),
            child: ListView.separated(
              itemCount: controller.comments.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder:
                  (_, index) => Container(
                    padding: const EdgeInsets.all(MySizes.defaultSpace),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(MySizes.defaultSpace),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.comments[index].fullName!,
                          style: TextTheme.of(context).bodyMedium,
                        ),
                        Text(
                          controller.comments[index].comment!,
                          style: TextTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
              separatorBuilder:
                  (BuildContext context, int index) => const SizedBox(
                    height: MySizes.defaultSpace,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
