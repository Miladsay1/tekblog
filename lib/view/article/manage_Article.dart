// ignore: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tekblog/component/my_colors.dart';
import 'package:tekblog/component/my_coponent.dart';
import 'package:tekblog/component/my_string.dart';
import 'package:tekblog/controller/manage_Article_controller.dart';
import 'package:tekblog/gen/assets.gen.dart';

// ignore: must_be_immutable
class ManageArticle extends StatelessWidget {
  ManageArticle({super.key});
  var articleManageController = Get.find<ManageArticleController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 12;
    // ignore: unused_local_variable

    return SafeArea(
        child: Scaffold(
      appBar: appbar(bodyMargin, "مدیریت مقاله"),
      body: Obx(() => articleManageController.loading.value
          ? SpinKitFoldingCube(
              color: SolidColors.primeryColor,
              size: 50.0,
            )
          : articleManageController.articleList.isNotEmpty
              ? ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: articleManageController.articleList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        // route to Single manage
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
                                  imageUrl: articleManageController
                                      .articleList[index].image!,
                                  imageBuilder: (context, imageProvider) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)),
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
                                      articleManageController
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
                                        articleManageController
                                            .articleList[index].author!,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "${articleManageController.articleList[index].view!}  بازدید",
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
                )
              : articleEmptyState(size, bodyMargin, textTheme)),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(35, 0, 35, 12),
        child: ElevatedButton(
          style: ButtonStyle(
              fixedSize: WidgetStateProperty.all(
                  Size(Get.width / 5, Get.height / 15))),
          onPressed: () {
            Get.toNamed('/SingleManageArticle');
          },
          // ignore: sort_child_properties_last
          child: Text(
            "بریم برای نوشتن یه مقاله باحال",
            style: textTheme.headlineLarge,
          ),
        ),
      ),
    ));
  }

  Center articleEmptyState(Size size, double bodyMargin, TextTheme textTheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.images.iconsafheAvalMaghalat.path,
            height: size.height / 7,
          ),
          Padding(
            padding: EdgeInsets.only(top: bodyMargin),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: MyString.matnsafheAvalModiriatMaghalat,
                    style: textTheme.bodyLarge)),
          ),
          SizedBox(
            height: Get.height / 3,
          ),
        ],
      ),
    );
  }
}
