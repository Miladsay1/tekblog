// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tekblog/component/api_constant.dart';
import 'package:tekblog/model/article_info_model.dart';
import 'package:tekblog/model/article_model.dart';
import 'package:tekblog/model/tag_model.dart';
import 'package:tekblog/services/dio_service.dart';

class ManageArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList.empty();
  RxList<Tagsmodel> tagList = RxList.empty();
  RxBool loading = false.obs;
  TextEditingController titleTextEditingController = TextEditingController();
  Rx<ArticleInfoModel> articleinfoModel = ArticleInfoModel(
          "اینجا عنوان مقاله قرار میگیره ، یه عنوان جذاب انتخاب کن",
          '''من متن و بدنه اصلی مقاله هستم ، اگه میخوای من رو ویرایش کنی و یه مقاله جذاب بنویسی ، نوشته آبی رنگ بالا که نوشته "ویرایش متن اصلی مقاله" رو با انگشتت لمس کن تا وارد ویرایشگر بشی''',
          "")
      .obs;
  @override
  onInit() {
    super.onInit();
    getManageArticle();
  }

  getManageArticle() async {
    loading.value = true;

    // ignore: todo
    //TODO get userid from getStorage ApiConstant.getArticleList+userid
    // var response = await DioService().getMethod(ApiUrlConstant.publishedByMe+GetStorage().read(StorageKey.user_id));
    var response =
        await DioService().getMethod("${ApiUrlConstant.publishedByMe}1");

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromjson(element));
      });

      loading.value = false;
    }
  }

  updateTitle() {
    articleinfoModel.update((val) {
      val!.title = titleTextEditingController.text;
    });
  }
}
