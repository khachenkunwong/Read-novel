import 'package:flutter/material.dart';
import 'package:read_novel/screan/login.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // กำหนด false ทำให้ debug เเถบเเดงหายไป
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // หน้าจอเริ่มต้น 
      home: AnimatedSplashScreen(
        splash: 'assets/images/menu_book_black_24dp.png',
        //หน้าต่อไปเมื่อ เมื่อหน้านี้ทำงานเสร้จ
        nextScreen: const LoginWidget(),
        // animation ภาพใน splash
        splashTransition: SplashTransition.fadeTransition,
        // สีพื้นหลัง
        backgroundColor: const Color(0xFF00DCA7),
        // ขนาดของภาพ
        splashIconSize: 200.0,
      ),
    );
  }
}
