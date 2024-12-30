// ignore: duplicate_ignore
// ignore: file_names

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tekblog/gen/assets.gen.dart';
import 'package:tekblog/model/fake_data.dart';
import 'package:tekblog/model/profile_screen.dart';
import 'package:tekblog/model/regester_intro.dart';
import 'package:tekblog/my_colors.dart';
import 'package:tekblog/my_string.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  var selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 12;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: SolidColors.scafoldBG,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.menu),
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
            Center(
              child: Positioned.fill(
                  child: IndexedStack(
                index: selectedPageIndex,
                children: [
                  HomeScreen(
                      size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                  ProfilScreen(
                      size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                  RegesterIntro(),
                ],
              )),
            ),

            // piade sazi hale zir bootonnavigitorbar
            NavigitorBottonHomepage(
              size: size,
              bodyMargin: bodyMargin,
              changeScreen: (int value) {
                setState(() {
                  selectedPageIndex = value;
                });
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
  const HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          // استک برای پیاده سازی تصویر و هاله تصویر و بقیه اجزا

          // در قسمت 46 ما جهت آموزش داده هارا از map موجود در fake_data اجرا کردیم
          PosterEbtayi(size: size, textTheme: textTheme),
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
          ListViweHotBlog(
              size: size, bodyMargin: bodyMargin, textTheme: textTheme),
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
          ListHotpodcast(size: size, bodyMargin: bodyMargin),
          //  dadan yek saizedbox baray ertefa ezafi ke title listhotpodcast zir nevigitorbotton naravad
          SizedBox(
            height: size.height / 9,
          ),
        ],
      ),
    );
  }
}

class ListHotpodcast extends StatelessWidget {
  const ListHotpodcast({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: size.height / 4.0,
            child: ListView.builder(
                itemCount: hotPodcastList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: SizedBox(
                            height: size.height / 5.3,
                            width: size.width / 2.4,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          hotPodcastList[index].poster),
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
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: index == 0 ? bodyMargin : 15),
                          child: SizedBox(
                              width: size.width / 2.4,
                              child: Text(
                                hotPodcastList[index].title,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "dana",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              )),
                        )
                      ],
                    ),
                  );
                }))),
      ],
    );
  }
}

class ListViweHotBlog extends StatelessWidget {
  const ListViweHotBlog({
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
        height: size.height / 3.5,
        child: ListView.builder(
            itemCount: blogList.getRange(0, 5).length,
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
                                      image: NetworkImage(
                                          blogList[index].imageUrl),
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
                                    blogList[index].writer,
                                    style: textTheme.bodySmall,
                                  ),
                                  Row(children: [
                                    Text(blogList[index].views),
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
                          blogList[index].title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(color: Colors.black),
                        )),
                  ],
                ),
              );
            })));
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

class PosterEbtayi extends StatelessWidget {
  const PosterEbtayi({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.2,
          height: size.height / 3.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
                // از fake_data فراخوانی کردیم تصویر رو
                image: AssetImage(homePagePosterMap["imageAsset"]),
                fit: BoxFit.fill),
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
                    homePagePosterMap["write"] +
                        // ignore: prefer_interpolation_to_compose_strings
                        " - " +
                        homePagePosterMap["date"],
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
