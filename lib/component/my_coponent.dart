import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tekblog/component/my_colors.dart';
import 'package:tekblog/component/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.dividercolor,
      thickness: 1,
      indent: size.width / 5.5,
      endIndent: size.width / 5.5,
    );
  }
}

Future<void> mylunchUrl(String url) async {
  final Uri uri = Uri.parse(url); // تبدیل آدرس به Uri
  if (!await launchUrl(uri)) {
    throw 'لینک نمی‌تواند باز شود: $url';
  }
}

// dar ghesmat ebtday gar kelasi li estefade mikoni bodymargin ra ezafe konid     var size = MediaQuery.of(context).size; double bodyMargin = size.width / 12;
PreferredSize appbar(double bodyMargin, String title) {
  return PreferredSize(
    preferredSize: Size.fromHeight(70),
    child: Padding(
      padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin, top: 12),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Center(
            child: Text(
              title,
              style: appBarTextStyle,
            ),
          )
        ],
        leading: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              color: SolidColors.primeryColor.withAlpha(150),
              shape: BoxShape.circle),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}
