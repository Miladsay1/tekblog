import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:html_editor_enhanced/html_editor.dart';
import 'package:tekblog/component/my_coponent.dart';
import 'package:tekblog/controller/manage_Article_controller.dart';

// ignore: must_be_immutable
class ArticleControllerEditor extends StatelessWidget {
  ArticleControllerEditor({super.key});
  final HtmlEditorController controller = HtmlEditorController();
  var manageArticleController = Get.put(ManageArticleController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.clearFocus(),
      child: Scaffold(
        appBar: appbar(Get.width / 12, "نوشتن/ویرایش مقاله"),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HtmlEditor(
                controller: controller,
                htmlEditorOptions: HtmlEditorOptions(
                  shouldEnsureVisible: true,
                  hint: "میتونی اینجا نوشته مقالت رو اضافه کنی",
                  initialText:
                      manageArticleController.articleinfoModel.value.content!,
                ),
                callbacks: Callbacks(
                  onChangeContent: (String? p0) {
                    manageArticleController.articleinfoModel.value.content =
                        p0 ?? "";
                    log(manageArticleController.articleinfoModel.value.content
                        .toString());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
