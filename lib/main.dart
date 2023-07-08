import 'package:flutter/material.dart';
import 'vue/mainIndex.dart';
import "controlleur/router.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: mainTheme,
    );
  }
}
