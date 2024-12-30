import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tekblog/gen/assets.gen.dart';
import 'package:tekblog/my_colors.dart';
import 'package:tekblog/my_string.dart';

class RegesterIntro extends StatelessWidget {
  const RegesterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    // ignore: unused_local_variable
    double bodyMargin = size.width / 12;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.images.iconsabtnam.path,
              height: size.height / 7,
            ),
            Padding(
              padding: EdgeInsets.only(top: bodyMargin),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: MyString.welcomeRegesterPage,
                      style: textTheme.bodyLarge)),
            ),
            SizedBox(
              height: size.height / 20,
            ),
            ElevatedButton(
                onPressed: () {},
                // ignore: sort_child_properties_last
                child: Text(
                  "بزن بریم",
                  style: textTheme.headlineLarge,
                ),
                style: ButtonStyle(
                    textStyle: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return textTheme.headlineLarge;
                  }
                  return textTheme.bodyMedium;
                }), backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return SolidColors.colorTitle;
                  }
                  return SolidColors.primeryColor;
                })))
          ],
        ),
      ),
    ));
  }
}
