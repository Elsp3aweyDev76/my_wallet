import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wallet/core/routing/go_router.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: HomePageViewBody(),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                // العودة لشاشة تسجيل الدخول
                if (!context.mounted) return;
                GoRouter.of(context).go(kLoginView);
              },
              child: Text("Sign out "),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageViewBody extends StatelessWidget {
  const HomePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Welcome to the Home Page!'));
  }
}
