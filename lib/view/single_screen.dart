import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tekblog/component/my_colors.dart';
import 'package:tekblog/component/my_string.dart';
import 'package:tekblog/component/text_style.dart';
import 'package:tekblog/controller/home_screen_controller.dart';
import 'package:tekblog/controller/list_article_cotroller.dart';
import 'package:tekblog/controller/single_article_cotroller.dart';
import 'package:tekblog/gen/assets.gen.dart';
import 'package:tekblog/model/fake_data.dart';
import 'package:tekblog/view/article_list_screen.dart';

class SingleScreen extends StatelessWidget {
  SingleScreen({super.key});

  SingleArticleCotroller singleArticleCotroller =
      Get.put(SingleArticleCotroller());

  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 12;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Obx(
          // baray hal moshken jelogiri az null neshan dadan az shart yek khati zir estefade kardim
          () => singleArticleCotroller.articleInfoModel.value.title == null
              ? SizedBox(
                  height: size.height,
                  child: SpinKitFoldingCube(
                    color: SolidColors.primeryColor,
                    size: 50.0,
                  ),
                )
              : Column(
                  children: [
                    Stack(
                      children: [
                        CachedNetworkImage(
                            imageUrl: singleArticleCotroller
                                .articleInfoModel.value.image!,
                            imageBuilder: (context, imageProvider) {
                              return Image(image: imageProvider);
                            },
                            placeholder: (context, url) {
                              return SpinKitFoldingCube(
                                color: SolidColors.primeryColor,
                                size: 50.0,
                              );
                            },
                            errorWidget: (context, url, error) => Image(
                                image: AssetImage(
                                    Assets.images.singlePlaceHolder.path))),
                        Positioned(
                            top: 0,
                            right: 0,
                            left: 0,
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      end: Alignment.bottomCenter,
                                      begin: Alignment.topCenter,
                                      colors:
                                          GradianColors.singleAppbarGradion)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Icon(
                                    Icons.bookmark_border_rounded,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      // api har maghale ersal shavad
                                      await Share.share(MyString.shareText);
                                    },
                                    child: Icon(
                                      Icons.share,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: 20, left: 20, top: 25, bottom: 0),
                      child: Text(
                        singleArticleCotroller.articleInfoModel.value.title!,
                        maxLines: 2,
                        style: sigleScreenTitleTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage(Assets.images.avatarIcon.path),
                            height: size.height / 20,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            singleArticleCotroller
                                .articleInfoModel.value.author!,
                            style: textTheme.bodyLarge,
                          ),
                          SizedBox(
                            width: 32,
                          ),
                          Text(
                            singleArticleCotroller
                                .articleInfoModel.value.createdAt!,
                            style: TextStyle(
                                color: Color.fromARGB(255, 155, 155, 155)),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: HtmlWidget(
                        singleArticleCotroller.articleInfoModel.value.content!,
                        textStyle: sigleScreenLongTextStyle,
                        enableCaching: true,
                        onLoadingBuilder: (context, element, loadingProgress) =>
                            SpinKitFoldingCube(
                          color: SolidColors.primeryColor,
                          size: 50.0,
                        ),
                      ),
                    ),
                    // ghesmat tag payin matn
                    Padding(
                      padding:
                          EdgeInsets.only(right: bodyMargin, left: bodyMargin),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SizedBox(
                          width: double.infinity,
                          height: size.height / 20,
                          child: GridView.builder(
                              itemCount: singleArticleCotroller.taglist.length,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5,
                                      childAspectRatio: 0.35),
                              itemBuilder: ((context, index) {
                                // cantainer ra az safhe mainscreen hman jayi ki tag ha hastand copy kardim
                                return GestureDetector(
                                  onTap: () async {
                                    var tagId = singleArticleCotroller
                                        .taglist[index].id!;
                                    await Get.find<ListArticleCotroller>()
                                        .getArticleListWithTagsId(tagId);

                                    String tagName = singleArticleCotroller
                                        .taglist[index].title!;
                                    Get.to(ArticleListScreen(
                                      title: tagName,
                                    ));
                                  },
                                  child: Container(
                                      height: size.height / 14,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color: Color.fromARGB(
                                              255, 242, 242, 242)),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 10, 0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                singleArticleCotroller
                                                    .taglist[index].title!,
                                                style: textTheme.bodyLarge,
                                              ),
                                            ]),
                                      )),
                                );
                              })),
                        ),
                      ),
                    ),
                    // ghesmat mataleb mortabet
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 32, 20, 10),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage(Assets.images.iconghalam.path),
                            height: size.width / 20,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "نوشته های مرتبط",
                            style: textTheme.headlineSmall,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                        height: size.height / 3.5,
                        child: Obx(
                          () => ListView.builder(
                              itemCount:
                                  singleArticleCotroller.releatedList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: ((context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    singleArticleCotroller.getArticleInfo(
                                        singleArticleCotroller
                                            .releatedList[index].id);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        right: index == 0 ? 15 : 0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: SizedBox(
                                            height: size.height / 6.5,
                                            width: size.width / 2.8,
                                            child: Stack(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  16)),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              singleArticleCotroller
                                                                  .releatedList[
                                                                      index]
                                                                  .image!),
                                                          fit: BoxFit.cover)),
                                                  foregroundDecoration:
                                                      BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                16)),
                                                    gradient: LinearGradient(
                                                        begin: Alignment
                                                            .bottomCenter,
                                                        end:
                                                            Alignment.topCenter,
                                                        colors: GradianColors
                                                            .hotBlogList),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 8,
                                                  right: 0,
                                                  left: 0,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Text(
                                                        singleArticleCotroller
                                                            .releatedList[index]
                                                            .author!,
                                                        style:
                                                            textTheme.bodySmall,
                                                      ),
                                                      Row(children: [
                                                        Text(
                                                            singleArticleCotroller
                                                                .releatedList[
                                                                    index]
                                                                .view!),
                                                        SizedBox(
                                                          width: 6,
                                                        ),
                                                        Icon(
                                                          Icons.remove_red_eye,
                                                          color: Colors.white,
                                                        ),
                                                      ]),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 8),
                                          child: SizedBox(
                                              width: size.width / 2.4,
                                              child: Text(
                                                singleArticleCotroller
                                                    .releatedList[index].title!,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              })),
                        )),
                  ],
                ),
        ),
      ),
    ));
  }
}
