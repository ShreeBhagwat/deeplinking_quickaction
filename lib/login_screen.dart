// create an entire login screen with login button in center of the screen please

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_actions/quick_actions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String text = 'Login';
  final quickAction = QuickActions();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callApi();
    initQuickAction();
  }

  Future callApi() async {
    log('API CALLED');
    await Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        text = 'Success';
      });
    });
  }

  void initQuickAction() {
    quickAction.setShortcutItems([
      const ShortcutItem(
          type: 'listview', localizedTitle: 'List', icon: 'AppIcon'),
      const ShortcutItem(
          type: 'detailview', localizedTitle: 'Detail', icon: 'AppIcon'),
    ]);

    quickAction.initialize((shortcutType) {
      if (shortcutType == 'listview') {
        GoRouter.of(context).push('/listview');
      } else if (shortcutType == 'detailview') {
        GoRouter.of(context).push('/detail/1');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            GoRouter.of(context).push('/listview');
          },
          child:  Text(text),
        ),
      ),
    );
  }
}
