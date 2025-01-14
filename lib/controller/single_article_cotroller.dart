import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tekblog/component/api_constant.dart';
import 'package:tekblog/model/article_info_model.dart';
import 'package:tekblog/model/article_model.dart';
import 'package:tekblog/model/tag_model.dart';
import 'package:tekblog/services/dio_service.dart';
import 'package:tekblog/view/single_screen.dart';

class SingleArticleCotroller extends GetxController {
  RxInt id = RxInt(0);
  RxBool loading = false.obs;
  RxList<Tagsmodel> taglist = RxList();
  RxList<ArticleModel> releatedList = RxList();
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;

  @override
  onInit() {
    super.onInit();
    // getArticleInfo();
  }

  getArticleInfo(var id) async {
    articleInfoModel = ArticleInfoModel().obs;
    loading.value = true;
    var userId = '';
    debugPrint(ApiUrlConstant.baseUrl +
        'article/get.php?command=info&id=$id&user_id=$userId');
    // ignore: todo
    //TODO user id is hard code

    var response = await DioService().getMethod(ApiUrlConstant.baseUrl +
        'article/get.php?command=info&id=$id&user_id=$userId');

    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);
      loading.value = false;
    }

    taglist.clear();
    response.data['tags'].forEach((element) {
      taglist.add(Tagsmodel.fromJson(element));
    });

    releatedList.clear();
    response.data['related'].forEach((element) {
      releatedList.add(ArticleModel.fromjson(element));
    });
    Get.to(SingleScreen());
  }
}
