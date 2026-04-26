import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wallet/core/routing/go_router.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
