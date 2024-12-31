import 'package:flutter/material.dart';
import 'package:tekblog/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tekblog/mainScreen.dart';
import 'package:tekblog/my_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      var size = MediaQuery.of(context).size;
      var textTheme = Theme.of(context).textTheme;
      double bodyMargin = size.width / 12;
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement((MaterialPageRoute(
          builder: (context) =>
              Mainscreen(context, size, textTheme, bodyMargin))));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(Assets.images.startpage.path),
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.height / 6,
            ),
            SizedBox(
              height: 20,
            ),
            SpinKitFadingCube(
              color: SolidColors.primeryColor,
              size: 20,
            ),
          ],
        ),
      )),
    );
  }
}
