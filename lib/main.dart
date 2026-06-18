import 'package:firebase_auth/firebase_auth.dart'; // 1. أضف استيراد FirebaseAuth
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_wallet/core/routing/go_router.dart';
import 'package:my_wallet/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseAuth.instance.signOut();
  final user = FirebaseAuth.instance.currentUser;

  runApp(MyApp(isLoggedIn: user != null));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn; // تعريف المتغير لاستقبال الحالة
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // routerConfig: AppRouter.createRouter(true),
      routerConfig: AppRouter.createRouter(isLoggedIn),
      title: 'myWallet',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color(0xFFFF6B2C),
      ),
      debugShowCheckedModeBanner: false,
      // home: HomePageView(rootContext: context,),
    );
  }
}
