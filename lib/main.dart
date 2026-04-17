import 'package:flutter/material.dart';
import 'package:my_wallet/core/routing/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'myWallet',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black, // 👈 حدد اللون الأسود الصريح هنا
        // تأكد من ضبط الألوان الأخرى لتناسب هويتك البرتقالية
        primaryColor: const Color(0xFFFF6B2C),
      ),
      // home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
