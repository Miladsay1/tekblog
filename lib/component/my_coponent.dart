import 'package:flutter/material.dart';
import 'package:tekblog/component/my_colors.dart';
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
