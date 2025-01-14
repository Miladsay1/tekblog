import 'package:get/get.dart';
import 'package:tekblog/component/api_constant.dart';
import 'package:tekblog/model/article_model.dart';
import 'package:tekblog/services/dio_service.dart';

class ListArticleCotroller extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getList();
  }

  getList() async {
    loading.value = true;
    // ignore: todo
    //TODO get userid from getStorage ApiConstant.getArticleList+userid
    var response = await DioService().getMethod(ApiUrlConstant.getArticleList);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromjson(element));
      });
      loading.value = false;
    }
  }

  getArticleListWithTagsId(String id) async {
    articleList.clear();
    loading.value = true;
    // ignore: todo
    //TODO get userid from getStorage ApiConstant.getArticleList+userid
    var response = await DioService().getMethod(ApiUrlConstant.baseUrl +
        'article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=');

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromjson(element));
      });
      loading.value = false;
    }
  }
}
