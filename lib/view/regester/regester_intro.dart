import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:tekblog/controller/regester_controller.dart';
import 'package:tekblog/gen/assets.gen.dart';

import 'package:tekblog/component/my_string.dart';
import 'package:validators/validators.dart';

// ignore: must_be_immutable
class RegesterIntro extends StatelessWidget {
  RegesterIntro({super.key});

  var regesterController = Get.find<RegesterController>();
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
              onPressed: () {
                // ghesmat botton sheet ke bad az kilik roye bezen berim ejra khahad shod
                _showEmailBottomSheet(context, size, textTheme, bodyMargin);
              },
              // ignore: sort_child_properties_last
              child: Text(
                "بزن بریم",
                style: textTheme.headlineLarge,
              ),
            )
          ],
        ),
      ),
    ));
  }

  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, Size size, TextTheme textTheme, double bodyMargin) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            // in padin baray in ast ke vagti keybord bala amad nazm bhm narizad
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2.55,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "لطفا ایمیلت رو وارد کن",
                      style: textTheme.bodyLarge,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(bodyMargin, size.height / 28,
                          bodyMargin, size.height / 28),
                      child: TextField(
                          controller:
                              regesterController.emailTextEditingController,
                          onChanged: (value) {
                            isEmail(value);
                          },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "miladsay@gmail.com",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 219, 219, 219)))),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Get.snackbar("", "کد فعالسازی ارسال شد");
                          // ejra function register az dio servis va register controller
                          regesterController.registr();
                          Navigator.pop(context);
                          _activatedBottomSheet(
                              context, size, textTheme, bodyMargin);
                        },
                        child: Text("ادامه", style: textTheme.headlineLarge))
                  ],
                ),
              ),
            ),
          );
        });
  }

// safhe vard kardan kod daryafti az email
  Future<dynamic> _activatedBottomSheet(
      BuildContext context, Size size, TextTheme textTheme, double bodyMargin) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            // in padin baray in ast ke vagti keybord bala amad nazm bhm narizad
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2.55,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "کد فعال سازی رو وارد کن ",
                      style: textTheme.bodyLarge,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(bodyMargin, size.height / 28,
                          bodyMargin, size.height / 28),
                      child: TextField(
                          controller:
                              regesterController.activitedTextEditingController,
                          onChanged: (value) {
                            isEmail(value);
                          },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "******",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 219, 219, 219)))),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          regesterController.verify();
                          // Navigator.of(context).pushReplacement(
                          //     MaterialPageRoute(
                          //         builder: (context) => MyCats()));
                        },
                        child: Text("ادامه", style: textTheme.headlineLarge))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
