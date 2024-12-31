import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tekblog/gen/assets.gen.dart';

class MyCats extends StatelessWidget {
  const MyCats({super.key});

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.images.iconsabtnam.path,
            height: size.height / 7,
          ),
        ],
      ),
    )));
  }
}
