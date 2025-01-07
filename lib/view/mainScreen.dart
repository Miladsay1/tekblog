// ignore: duplicate_ignore
// ignore: file_names

// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tekblog/component/my_coponent.dart';
import 'package:tekblog/controller/home_screen_controller.dart';
import 'package:tekblog/gen/assets.gen.dart';
import 'package:tekblog/model/fake_data.dart';
import 'package:tekblog/view/profile_screen.dart';
import 'package:tekblog/view/regester_intro.dart';
import 'package:tekblog/component/my_colors.dart';
import 'package:tekblog/component/my_string.dart';

// baray tarif kardan dokme menu baray drawer in payini ra ezafe kardim
final GlobalKey<ScaffoldState> _key = GlobalKey();

// ignore: must_be_immutable
class Mainscreen extends StatelessWidget {
  RxInt selectedPageIndex = 0.obs;

  Mainscreen(
      BuildContext context, Size size, TextTheme textTheme, double bodyMargin,
      {super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 12;

    return SafeArea(
      child: Scaffold(
        // in key baray estefade az sakhtar Global ast ke masalan dar sakhtar dokme shakhsi menudar ghesmat appbar esteade kardim
        key: _key,
        // ghesmat kilik bar riy icon meno
        drawer: Drawer(
          backgroundColor: SolidColors.scafoldBG,
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Image(
                    image: AssetImage(Assets.images.startpage.path),
                    height: size.height / 8,
                  ),
                ),
                ListTile(
                  title: Text(
                    "پروفایل کاربری",
                    style: textTheme.bodyLarge,
                  ),
                  onTap: () {},
                ),
                Divider(
                  color: SolidColors.dividercolor,
                ),
                ListTile(
                  title: Text(
                    "درباره تک‌بلاگ",
                    style: textTheme.bodyLarge,
                  ),
                  onTap: () {},
                ),
                Divider(
                  color: SolidColors.dividercolor,
                ),
                ListTile(
                  title: Text(
                    "اشتراک گذاری تک بلاگ",
                    style: textTheme.bodyLarge,
                  ),
                  onTap: () async {
                    await Share.share(MyString.shareText);
                  },
                ),
                Divider(
                  color: SolidColors.dividercolor,
                ),
                ListTile(
                  title: Text(
                    "تک‌بلاگ در گیت هاب",
                    style: textTheme.bodyLarge,
                  ),
                  onTap: () {
                    mylunchUrl("https://github.com/Miladsay1/tekblog");
                  },
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          // in payini baraye in ast ke icon ezafi ezafe nashavad mesl icon drawer k sakhtim
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: SolidColors.scafoldBG,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: () {
                    _key.currentState!.openDrawer();
                  },
                  child: Icon(Icons.menu)),
              Image(
                image: AssetImage(Assets.images.startpage.path),
                height: size.height / 10,
              ),
              Icon(Icons.search)
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
          child: Stack(children: [
            Positioned.fill(
                child: Obx(
              () => IndexedStack(
                index: selectedPageIndex.value,
                children: [
                  HomeScreen(
                      size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                  ProfilScreen(
                      size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                  RegesterIntro(),
                ],
              ),
            )),

            // piade sazi hale zir bootonnavigitorbar
            NavigitorBottonHomepage(
              size: size,
              bodyMargin: bodyMargin,
              changeScreen: (int value) {
                selectedPageIndex.value = value;
              },
            ),
          ]),
        ),
      ),
    );
  }
}

class NavigitorBottonHomepage extends StatelessWidget {
  const NavigitorBottonHomepage({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  });

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      bottom: 8,
      child: Container(
        height: size.height / 14,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: GradianColors.bottonNvBg,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(right: bodyMargin * 1.4, left: bodyMargin * 1.4),
          child: Container(
            height: size.height / 11,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: GradianColors.bottonNV),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: (() => changeScreen(0)),
                  icon: Image(
                    image: AssetImage(
                      Assets.images.homeicon.path,
                    ),
                    height: size.height / 24,
                  ),
                ),
                IconButton(
                  onPressed: (() => changeScreen(2)),
                  icon: Image(
                    image: AssetImage(
                      Assets.images.par.path,
                    ),
                    height: size.height / 24,
                  ),
                ),
                IconButton(
                  onPressed: (() => changeScreen(1)),
                  icon: Image(
                    image: AssetImage(
                      Assets.images.user.path,
                    ),
                    height: size.height / 24,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(
        () => homeScreenController.loading.value == false
            ? Column(
                children: [
                  // استک برای پیاده سازی تصویر و هاله تصویر و بقیه اجزا

                  // در قسمت 46 ما جهت آموزش داده هارا از map موجود در fake_data اجرا کردیم
                  poster(),
                  HomePageTaglist(
                      size: size, bodyMargin: bodyMargin, textTheme: textTheme),
                  // ghesmat neveshte hay dagh icon+matn neveshte az class mystring add shod
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 32, bodyMargin, 15),
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
                          MyString.viewHotesBlog,
                          style: textTheme.headlineSmall,
                        )
                      ],
                    ),
                  ),
                  topVisited(),
                  // ghesmat hot podcast payin safhe aval
                  Padding(
                    padding: EdgeInsets.only(right: bodyMargin),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(Assets.images.padcostIcon.path),
                          height: size.width / 18,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          MyString.viewHotesPadcast,
                          style: textTheme.headlineSmall,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  topPodcast(),
                  //  dadan yek saizedbox baray ertefa ezafi ke title listhotpodcast zir nevigitorbotton naravad
                  SizedBox(
                    height: size.height / 9,
                  ),
                ],
              )

            // edame shart loadin safhe
            : SpinKitFoldingCube(
                color: SolidColors.primeryColor,
                size: 50.0,
              ),
      ),
    );
  }

  Widget topVisited() {
    return SizedBox(
        height: size.height / 3.5,
        child: Obx(
          () => ListView.builder(
              itemCount: homeScreenController.topvisitedlist.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: SizedBox(
                          height: size.height / 5.3,
                          width: size.width / 2.4,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    image: DecorationImage(
                                        image: NetworkImage(homeScreenController
                                            .topvisitedlist[index].image!),
                                        fit: BoxFit.cover)),
                                foregroundDecoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: GradianColors.hotBlogList),
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                right: 0,
                                left: 0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      homeScreenController
                                          .topvisitedlist[index].author!,
                                      style: textTheme.bodySmall,
                                    ),
                                    Row(children: [
                                      Text(homeScreenController
                                          .topvisitedlist[index].view!),
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
                      SizedBox(
                          width: size.width / 2.4,
                          child: Text(
                            homeScreenController.topvisitedlist[index].title!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(color: Colors.black),
                          )),
                    ],
                  ),
                );
              })),
        ));
  }

  Widget topPodcast() {
    return SizedBox(
        height: size.height / 3.5,
        child: Obx(
          () => ListView.builder(
              itemCount: homeScreenController.topPodcast.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: SizedBox(
                            height: size.height / 5.3,
                            width: size.width / 2.4,
                            // estefade az package chashed-network-image baraye load tasvir
                            child: CachedNetworkImage(
                              imageUrl: homeScreenController
                                  .topPodcast[index].poster!,
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
                              placeholder: (context, url) => SpinKitFoldingCube(
                                color: SolidColors.primeryColor,
                                size: 32.0,
                              ),
                              errorWidget: (context, url, error) => Icon(
                                Icons.image_not_supported,
                                size: 40,
                                color: Colors.blueGrey,
                              ),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: index == 0 ? bodyMargin : 15),
                        child: SizedBox(
                            width: size.width / 2.4,
                            child: Text(
                              homeScreenController.topPodcast[index].title!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(color: Colors.black),
                            )),
                      ),
                    ],
                  ),
                );
              })),
        ));
  }

  Widget poster() {
    return Stack(
      children: [
        Container(
          width: size.width / 1.05,
          height: size.height / 3.8,
          // ignore: sort_child_properties_last
          child: CachedNetworkImage(
            imageUrl: homeScreenController.poster.value.image!,
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover)),
              );
            },
            placeholder: (context, url) => SpinKitFoldingCube(
              color: SolidColors.primeryColor,
              size: 32.0,
            ),
            errorWidget: (context, url, error) => Icon(
              Icons.image_not_supported,
              size: 40,
              color: Colors.blueGrey,
            ),
          ),

          // تعریف foregroundDecoration گرادین (همون هاله تم تصویر)
          foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(
                  // گرادین از نوع خطی شروع از بالا تا پایین
                  colors: GradianColors.homePosterGradian,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: 8,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // تم متن هارو در صفحه main.dart تعریف کردیم و بالای این کلاس مثل سایز یک پارامتر ساختیم
                  Text(
                    homeScreenController.poster.value.title!,
                    style: textTheme.bodySmall,
                  ),

                  Row(
                    children: [
                      Text(homePagePosterMap["viwe"]),
                      SizedBox(
                        width: 6,
                      ),
                      Icon(
                        Icons.remove_red_eye,
                        color: Colors.white,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "دوازده قدم برنامه نویسی یک دوره ی...س",
                style: textTheme.headlineLarge,
              )
            ],
          ),
        )
      ],
    );
  }
}

class HomePageTaglist extends StatelessWidget {
  const HomePageTaglist({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 14,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tagList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 14, 8),
              child: Container(
                  height: size.height / 14,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(13)),
                      gradient: LinearGradient(
                          colors: GradianColors.tags,
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                    child: Row(children: [
                      Image(
                        image: AssetImage(Assets.images.hastag.path),
                        width: size.width / 24,
                        height: size.width / 24,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        tagList[index].title,
                        style: textTheme.headlineMedium,
                      )
                    ]),
                  )),
            );
          }),
    );
  }
}
