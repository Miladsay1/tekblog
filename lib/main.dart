import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tekblog/component/my_colors.dart';
import 'package:tekblog/view/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter RTL Demo',
      // افزودن زبان‌های پشتیبانی شده
      supportedLocales: [
        Locale('en', ''), // انگلیسی
        Locale('fa', ''), // فارسی
      ],
      // افزودن localizationsDelegates
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // تنظیم جهت‌دهی براساس زبان
      locale: Locale('fa', ''), // زبان پیش‌فرض

      theme: ThemeData(
          // them baray ghesmat hayi k gharare karbar chizi vared kone
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(width: 2)),
          ),
          // them dome ha
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  SolidColors.primeryColor, // رنگ بنفش برای پس‌زمینه
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
          )),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
