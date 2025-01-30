import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import 'package:tekblog/component/my_colors.dart';
import 'package:tekblog/component/text_style.dart';
import 'package:tekblog/controller/file_controller.dart';
import 'package:tekblog/controller/home_screen_controller.dart';
import 'package:tekblog/controller/list_article_cotroller.dart';
import 'package:tekblog/controller/manage_Article_controller.dart';
import 'package:tekblog/gen/assets.gen.dart';
import 'package:tekblog/services/pick_file.dart';
import 'package:tekblog/view/article/article_content_editor.dart';

import 'package:tekblog/view/article/article_list_screen.dart';

// ignore: must_be_immutable
class SingleManageArticle extends StatelessWidget {
  SingleManageArticle({super.key});
  FilePickerController filepickercontroller = Get.put(FilePickerController());

  var manageArticleController = Get.find<ManageArticleController>();
  // function baray ersal onvan maghale
  gettitle() {
    Get.defaultDialog(
        title: "عنوان مقاله",
        titleStyle: TextStyle(color: SolidColors.scafoldBG),
        content: TextField(
          controller: manageArticleController.titleTextEditingController,
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "اینجا بنویس",
          ),
        ),
        backgroundColor: SolidColors.primeryColor,
        confirm: ElevatedButton(
          onPressed: () {
            manageArticleController.updateTitle();
            Get.back();
          },
          style: ButtonStyle(backgroundColor: WidgetStateColor.transparent),
          child: Text(
            "ثبت",
            style: TextStyle(color: Colors.white),
          ),
        ));
  }

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
          () => Column(
            children: [
              Stack(
                children: [
// tanzim kardim ke agar file nabod cach network ejra shavad
                  SizedBox(
                      width: Get.width,
                      height: Get.height / 3,
                      child: filepickercontroller.file.value.name == 'nothing'
                          ? CachedNetworkImage(
                              imageUrl: manageArticleController
                                  .articleinfoModel.value.image!,
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
                                      Assets.images.singlePlaceHolder.path)))
                          //baz kardan aks az image file upload aks
                          : Image.file(
                              File(filepickercontroller.file.value.path!),
                              fit: BoxFit.cover,
                              width: 200,
                            )),
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
                                colors: GradianColors.singleAppbarGradion)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                          ],
                        ),
                      )),
                  Positioned(
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            pichFile();
                          },
                          child: Container(
                            width: Get.width / 2.7,
                            height: 35,
                            decoration: BoxDecoration(
                                color: SolidColors.primeryColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 16, left: 16),
                              child: Row(
                                children: [
                                  Text(
                                    "انتخاب تصویر",
                                    style: textTheme.headlineLarge,
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 32, 20, 10),
                child: GestureDetector(
                  onTap: () {
                    gettitle();
                  },
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
                        " ویرایش عنوان مقاله",
                        style: textTheme.headlineSmall,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(right: 20, left: 20, top: 25, bottom: 0),
                child: Text(
                  manageArticleController.articleinfoModel.value.title!,
                  maxLines: 2,
                  style: sigleScreenTitleTextStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 32, 20, 10),
                child: GestureDetector(
                  onTap: () => Get.to(ArticleControllerEditor()),
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
                        " ویرایش متن اصلی مقاله",
                        style: textTheme.headlineSmall,
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: HtmlWidget(
                  manageArticleController.articleinfoModel.value.content!,
                  textStyle: sigleScreenLongTextStyle,
                  enableCaching: true,
                  onLoadingBuilder: (context, element, loadingProgress) =>
                      SpinKitFoldingCube(
                    color: SolidColors.primeryColor,
                    size: 50.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 32, 20, 10),
                child: GestureDetector(
                  onTap: () {
                    chooseCatsBottomSheet(textTheme);
                  },
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
                        "انتخاب دسته بندی",
                        style: textTheme.headlineSmall,
                      )
                    ],
                  ),
                ),
              ),
              // ghesmat tag payin matn
              Padding(
                padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: size.height / 20,
                    child: GridView.builder(
                        itemCount: manageArticleController.tagList.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            childAspectRatio: 0.35),
                        itemBuilder: ((context, index) {
                          // cantainer ra az safhe mainscreen hman jayi ki tag ha hastand copy kardim
                          return GestureDetector(
                            onTap: () async {
                              var tagId =
                                  manageArticleController.tagList[index].id!;
                              await Get.find<ListArticleCotroller>()
                                  .getArticleListWithTagsId(tagId);

                              String tagName =
                                  manageArticleController.tagList[index].title!;
                              Get.to(ArticleListScreen(
                                title: tagName,
                              ));
                            },
                            child: Container(
                                height: size.height / 14,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Color.fromARGB(255, 242, 242, 242)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          manageArticleController
                                              .tagList[index].title!,
                                          style: textTheme.bodyLarge,
                                        ),
                                      ]),
                                )),
                          );
                        })),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "ارسال مقاله",
                    style: textTheme.bodyMedium,
                  ))
            ],
          ),
        ),
      ),
    ));
  }

  chooseCatsBottomSheet(TextTheme textTheme) {
    var homeScreenController = Get.find<HomeScreenController>();
    Get.bottomSheet(
      Container(
        height: Get.height / 1.4,
        width: Get.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "انتخاب دسته بندی ",
                style: textTheme.bodyLarge,
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: Get.width / 18,
                    left: Get.width / 18,
                    top: Get.height / 18),
                child: SizedBox(
                  width: double.infinity,
                  height: Get.height / 1.7,
                  child: GridView.builder(
                      itemCount: homeScreenController.tagslist.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemBuilder: ((context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                              height: Get.height / 15,
                              decoration: BoxDecoration(
                                color: SolidColors.primeryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: Center(
                                  child: Text(
                                    homeScreenController.tagslist[index].title,
                                    style: textTheme.headlineMedium,
                                  ),
                                ),
                              )),
                        );
                      })),
                ),
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
      persistent: true,
    );
  }
}
