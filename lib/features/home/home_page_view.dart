import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wallet/core/constants/constants.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: HomePageViewBody(),
      // body: const Center(child: Text('Welcome to the Home Page!')),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                GoRouter.of(context).push(Constants.kLoginView);
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
