// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:my_wallet/core/routing/go_router.dart';
// import 'package:my_wallet/firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerConfig: router,
//       title: 'myWallet',
//       theme: ThemeData(
//         brightness: Brightness.dark,
//         scaffoldBackgroundColor: Colors.black, // 👈 حدد اللون الأسود الصريح هنا
//         // تأكد من ضبط الألوان الأخرى لتناسب هويتك البرتقالية
//         primaryColor: const Color(0xFFFF6B2C),
//       ),
//       // home: const HomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart'; // 1. أضف استيراد FirebaseAuth
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_wallet/core/routing/go_router.dart';
import 'package:my_wallet/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // 2. التحقق مما إذا كان هناك مستخدم مسجل حالياً في Firebase
  final user = FirebaseAuth.instance.currentUser;

  runApp(
    MyApp(
      // 3. نمرر نتيجة التحقق لتحديد الشاشة الابتدائية
      isLoggedIn: user != null,
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn; // تعريف المتغير لاستقبال الحالة
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // 4. تأكد أن ملف go_router.dart يستقبل isLoggedIn لتحديد المسار الابتدائي
      routerConfig: AppRouter.createRouter(isLoggedIn),
      title: 'myWallet',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color(0xFFFF6B2C),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
