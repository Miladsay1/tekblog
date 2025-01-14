import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tekblog/component/my_colors.dart';
import 'package:tekblog/component/my_coponent.dart';
import 'package:tekblog/component/text_style.dart';
import 'package:tekblog/controller/list_article_cotroller.dart';
import 'package:tekblog/controller/single_article_cotroller.dart';
import 'package:tekblog/view/single_screen.dart';

class ArticleListScreen extends StatelessWidget {
  String title;

  ArticleListScreen({required this.title, Key? key}) : super(key: key);

  ListArticleCotroller ListArticleController = Get.put(ListArticleCotroller());
  SingleArticleCotroller singleArticleCotroller =
      Get.put(SingleArticleCotroller());

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 12;
    return SafeArea(
        child: Scaffold(
      appBar: appbar(bodyMargin / 1.5, title),
      body: Padding(
        padding: EdgeInsets.only(left: bodyMargin),
        child: SizedBox(
          child: Obx(
            () => ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: ListArticleController.articleList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    singleArticleCotroller.getArticleInfo(
                        ListArticleController.articleList[index].id);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(bodyMargin / 5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: size.width / 3,
                            height: size.height / 6,
                            child: CachedNetworkImage(
                              imageUrl: ListArticleController
                                  .articleList[index].image!,
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover)),
                                );
                              },
                              placeholder: (context, url) {
                                return SpinKitFoldingCube(
                                  color: SolidColors.primeryColor,
                                  size: 50.0,
                                );
                              },
                              errorWidget: (context, url, error) => Icon(
                                Icons.image_not_supported,
                                size: 45,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: size.width / 2,
                                child: Text(
                                  ListArticleController
                                      .articleList[index].title!,
                                  style: textTheme.bodyLarge,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              SizedBox(
                                height: size.height / 65,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    ListArticleController
                                        .articleList[index].author!,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "${ListArticleController.articleList[index].view!}  بازدید",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              )
                            ],
                          )
                        ]),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    ));
  }
}
