import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('دموی راست‌چین'),
      ),
      body: Center(
        child: Text('سلام دنیا!'),
      ),
    );
  }
}
