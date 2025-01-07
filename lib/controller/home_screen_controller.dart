import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tekblog/component/api_constant.dart';
import 'package:tekblog/model/article_model.dart';
import 'package:tekblog/model/podcast_model.dart';
import 'package:tekblog/model/poster_model.dart';
import 'package:tekblog/services/dio_service.dart';

class HomeScreenController extends GetxController {
  late Rx<PosterModel> poster = PosterModel().obs;
  RxList tagslist = RxList();
  RxList<ArticleModel> topvisitedlist = RxList();
  RxList<PodcastModel> topPodcast = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    loading.value = true;
    var response = await DioService().getMethod(ApiUrlConstant.getHomeItems);

    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topvisitedlist.add(ArticleModel.fromjson(element));
      });
      response.data['top_podcasts'].forEach((element) {
        topPodcast.add(PodcastModel.fromJson(element));
      });
      poster.value = PosterModel.fromJson(response.data['poster']);
      loading.value = false;
    }
  }
}
