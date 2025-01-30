import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tekblog/component/api_constant.dart';
import 'package:tekblog/component/storage_const.dart';
import 'package:tekblog/gen/assets.gen.dart';
import 'package:tekblog/services/dio_service.dart';
import 'package:tekblog/view/my_cats.dart';
import 'package:tekblog/view/regester/regester_intro.dart';

class RegesterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activitedTextEditingController =
      TextEditingController();
  var email = '';
  // ignore: non_constant_identifier_names
  var user_id = '';

  /// ثبت‌نام
  registr() async {
    try {
      Map<String, dynamic> map = {
        'email': emailTextEditingController.text,
        'command': 'register',
      };

      log('Register request: $map');
      var response =
          await DioService().postMetod(map, ApiUrlConstant.postRegister);

      if (response.statusCode == 200 && response.data['response'] == true) {
        email = emailTextEditingController.text;
        user_id = response.data['user_id'].toString();

        log('Registration successful: User ID = $user_id');
      } else {
        log('Registration failed: ${response.data}');
        Get.snackbar('Error', 'Registration failed. Please try again.');
      }
    } catch (e) {
      log('Error during registration: $e');
      Get.snackbar(
          'Error', 'An unexpected error occurred during registration.');
    }
  }

  /// تأیید
  verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': user_id,
      'code': activitedTextEditingController.text,
      'command': 'verify',
    };

    log('Verify request: $map');
    var response =
        await DioService().postMetod(map, ApiUrlConstant.postRegister);
    var status = response.data['response'];
    switch (status) {
      case 'verified':
        Get.snackbar(" ثبت نام با موفقیت انجام شد", "",
            colorText: Colors.green);
        var box = GetStorage();
        box.write('token', response.data['token']);
        box.write('user_id', response.data['user_id']);

        log('Verification successful');
        log("Token saved: ${box.read('token')}");
        log("User ID saved: ${box.read('user_id')}");

        // هدایت کاربر به صفحه SplashScreen
        Get.offAll(() => MyCats());
        break;
      case 'incorrect_code ':
        Get.snackbar("خطا", "کد فعالسازی غلط است", colorText: Colors.red);
        break;
      case 'expired':
        Get.snackbar("خطا", "کد فعالسازی منقضی شده است");
        break;
    }
  }

  togglelogain() {
    if (GetStorage().read(StorageKey.token) == null) {
      Get.to(RegesterIntro());
    } else {
      Get.snackbar("شما قبلا ثبت نام کرده اید", '', colorText: Colors.green);
      routeToWriteBottonSheet();
    }
  }

// booomsheet ersal maghale
  routeToWriteBottonSheet() {
    Get.bottomSheet(Container(
      height: Get.height / 3,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  Assets.images.iconsabtnam.path,
                  height: Get.height / 20,
                ),
                SizedBox(
                  width: 15,
                ),
                Center(
                  child: Text(
                    'دونسته هات رو با بقیه به اشتراک بذار ...',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
            SizedBox(
              height: Get.height / 23,
            ),
            Text(
              """فکر کن !!  اینجا بودنت به این معناست که یک گیک تکنولوژی هستی
            دونسته هات رو با  جامعه‌ی گیک های فارسی زبان به اشتراک بذار..""",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.offAndToNamed('/ManageArticle');
                  },
                  child: Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.images.modiriatMaghaleIcon.path,
                            height: Get.height / 23,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Center(
                            child: Text(
                              'مدیریت مقاله ها',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('برو به صفحه پادکست ها');
                  },
                  child: Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.images.modiriatpodcastIcon.path,
                            height: Get.height / 23,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Center(
                            child: Text(
                              "مدیریت پادکست ها",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
