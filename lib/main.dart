import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:subscriber/detail_screen.dart';
import 'package:subscriber/listview_screen.dart';
import 'package:subscriber/login_screen.dart';

void main() {
  runApp(const DeeplinkTrial());
}

class DeeplinkTrial extends StatelessWidget {
  const DeeplinkTrial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '/listview',
    builder: (context, state) => const ListViewScreen(),
  ),
  GoRoute(
    path: '/detail/:index',
    builder: (context, state) =>
        DetailScreen(index: state.pathParameters['index']!),
  ),
]);
