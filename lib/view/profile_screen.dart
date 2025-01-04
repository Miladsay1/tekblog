import 'package:flutter/material.dart';
import 'package:tekblog/gen/assets.gen.dart';
import 'package:tekblog/component/my_coponent.dart';
import 'package:tekblog/component/my_colors.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height / 20,
            ),
            Image(
              image: AssetImage(Assets.images.avatarIcon.path),
              height: size.height / 8,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(Assets.images.iconghalam.path),
                  height: size.width / 22,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "ویرایش عکس پروفایل",
                  style: textTheme.headlineSmall,
                )
              ],
            ),
            SizedBox(
              height: size.height / 9,
            ),
            Text(
              "میلاد صیادی ",
              style: textTheme.bodyLarge,
            ),
            Text(
              " miladsay@gmail.com",
              style: textTheme.bodyLarge,
            ),
            SizedBox(
              height: size.height / 14,
            ),
            TechDivider(size: size),
            InkWell(
              onTap: () {},
              splashColor: SolidColors.primeryColor,
              child: SizedBox(
                height: 45,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "مقالات مورد علاقه من",
                    style: textTheme.bodyLarge,
                  ),
                ),
              ),
            ),
            TechDivider(size: size),
            InkWell(
              onTap: () {},
              splashColor: SolidColors.primeryColor,
              child: SizedBox(
                height: 45,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "پادکست های مورد علاقه من",
                    style: textTheme.bodyLarge,
                  ),
                ),
              ),
            ),
            TechDivider(size: size),
            InkWell(
              onTap: () {},
              splashColor: SolidColors.primeryColor,
              child: SizedBox(
                height: 45,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "خروج از حساب کاربری",
                    style: textTheme.bodyLarge,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 12,
            ),
          ],
        ));
  }
}
