import 'package:chef/feature/core/controllers/comments/comments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentDialog extends StatelessWidget {
  CommentDialog({super.key});

  final commentController = Get.put(CommentsController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text('addComment'.tr),
      content: TextField(
        autofocus: true,
        decoration:  InputDecoration(
          hintText: 'textFieldHint'.tr,
          border: OutlineInputBorder(),
        ),
        onChanged: (value) => commentController.newComment.value = value,
        onSubmitted: (_) => commentController.addComment(),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child:  Text('cancel'.tr),
        ),
        Obx(() => TextButton(
          onPressed: commentController.newComment.value.trim().isEmpty
              ? null
              : commentController.addComment,
          child:  Text('add'.tr),
        )),
      ],
    );
  }
}