import 'package:get/get.dart';
import 'package:tekblog/controller/list_article_cotroller.dart';
import 'package:tekblog/controller/manage_Article_controller.dart';
import 'package:tekblog/controller/regester_controller.dart';
import 'package:tekblog/controller/single_article_cotroller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ListArticleCotroller());
    Get.lazyPut(() => SingleArticleCotroller());
  }
}

class ArticleManagerBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(ManageArticleController());
    Get.lazyPut(() => ManageArticleController());
  }
}

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegesterController());
  }
}
