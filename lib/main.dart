import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tekblog/binding.dart';
import 'package:tekblog/component/my_colors.dart';
import 'package:tekblog/view/article/manage_Article.dart';
import 'package:tekblog/view/article/single_manage_article.dart';
import 'package:tekblog/view/mainScreen.dart';
import 'package:tekblog/view/article/single_screen.dart';
import 'package:tekblog/view/splash_screen.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: RegisterBinding(),
      // taghir dadim be frsi saz khod getx
      locale: Locale("fa"),
      theme: lighttheme(),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/Mainscreen',
          page: () => Mainscreen(
              context,
              MediaQuery.of(context).size,
              Theme.of(context).textTheme,
              MediaQuery.of(context).size.width / 12),
        ),
        GetPage(
            name: "/SingleScreen",
            page: () => SingleScreen(),
            binding: ArticleBinding()),
        GetPage(
            name: "/ManageArticle",
            page: () => ManageArticle(),
            binding: ArticleManagerBinding()),
        GetPage(
            name: "/SingleManageArticle",
            page: () => SingleManageArticle(),
            binding: ArticleManagerBinding()),
      ],
      home: SplashScreen(),
    );
  }

  ThemeData lighttheme() {
    return ThemeData(
        // them baray ghesmat hayi k gharare karbar chizi vared kone
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(width: 2)),
        ),
        // them dome ha
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: SolidColors.primeryColor, // رنگ بنفش برای پس‌زمینه
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(12), // تنظیم حاشیه دکمه (اختیاری)
            ),
          ),
        ),

        // them matn ha
        fontFamily: "Dana",
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              fontFamily: "Dana",
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w700),
          bodyMedium: TextStyle(
            fontFamily: "Dana",
            fontSize: 13,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
          bodySmall: TextStyle(
            fontFamily: "Dana",
            fontSize: 13,
            color: Color.fromARGB(200, 255, 255, 255),
            fontWeight: FontWeight.w300,
          ),
          // فونت لیست افقی تگ ها
          headlineMedium: TextStyle(
            fontFamily: "Dana",
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
          // فونت سر تیتر های صفحه اصلی (نوشته های داغ )
          headlineSmall: TextStyle(
            fontFamily: "Dana",
            fontSize: 16,
            color: Color.fromARGB(255, 40, 107, 184),
            fontWeight: FontWeight.w700,
          ),
          // font estefade shode dae safhe user (profile_screen)
          bodyLarge: TextStyle(
              fontFamily: "Dana",
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ));
  }
}
