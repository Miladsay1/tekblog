import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tekblog/gen/assets.gen.dart';
import 'package:tekblog/view/mainScreen.dart';
import 'package:tekblog/model/data_model.dart';
import 'package:tekblog/model/fake_data.dart';
import 'package:tekblog/component/my_colors.dart';
import 'package:tekblog/component/my_string.dart';

class MyCats extends StatefulWidget {
  const MyCats({super.key});

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    var textTheme = Theme.of(context).textTheme;
    // ignore: unused_local_variable
    double bodyMargin = size.width / 12;
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.images.iconsabtnam.path,
              height: size.height / 7,
            ),
            Padding(
              padding: EdgeInsets.only(top: bodyMargin / 2),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: MyString.myCatsPage,
                      style: TextStyle(
                          color: Color.fromARGB(255, 66, 4, 87),
                          fontSize: 15,
                          fontFamily: "Dana"))),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(bodyMargin * 1.4, size.height / 28,
                  bodyMargin * 1.4, size.height / 28),
              child: TextField(
                  onChanged: (value) {},
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "نام و نام خانوادگی",
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 219, 219, 219)))),
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "دسته بندی هایی که دوست داری رو انتخاب کن",
                    style: TextStyle(
                        color: Color.fromARGB(255, 66, 4, 87),
                        fontSize: 15,
                        fontFamily: "Dana"))),
            SizedBox(
              height: bodyMargin / 2,
            ),
            Padding(
              padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
              child: SizedBox(
                width: double.infinity,
                height: size.height / 8.7,
                child: GridView.builder(
                    itemCount: tagList.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 0.35),
                    itemBuilder: ((context, index) {
                      // cantainer ra az safhe mainscreen hman jayi ki tag ha hastand copy kardim
                      return InkWell(
                        onTap: () {
                          setState(() {
                            if (!mySelectetCats.contains(tagList[index])) {
                              mySelectetCats.add(tagList[index]);
                            }
                          });
                        },
                        child: Container(
                            height: size.height / 14,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                gradient: LinearGradient(
                                    colors: GradianColors.tags,
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft)),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Row(children: [
                                Image(
                                  image: AssetImage(Assets.images.hastag.path),
                                  width: size.width / 24,
                                  height: size.width / 24,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  tagList[index].title,
                                  style: textTheme.headlineMedium,
                                )
                              ]),
                            )),
                      );
                    })),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: bodyMargin / 2.5, bottom: 10),
              child: SvgPicture.asset(
                Assets.images.felesh.path,
                height: size.height / 13,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
              child: SizedBox(
                width: double.infinity,
                height: size.height / 8.7,
                child: GridView.builder(
                    itemCount: mySelectetCats.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 0.35),
                    itemBuilder: ((context, index) {
                      // cantainer ra az safhe mainscreen hman jayi ki tag ha hastand copy kardim
                      return Container(
                          height: size.height / 14,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Color.fromARGB(255, 242, 242, 242)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    mySelectetCats[index].title,
                                    style: textTheme.bodyLarge,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        mySelectetCats.removeAt(index);
                                      });
                                    },
                                    child: Icon(
                                      CupertinoIcons.delete,
                                      color:
                                          const Color.fromARGB(255, 81, 80, 80),
                                      size: 20,
                                    ),
                                  ),
                                ]),
                          ));
                    })),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("ادامه", style: textTheme.headlineLarge))
          ],
        ),
      ),
    )));
  }
}
