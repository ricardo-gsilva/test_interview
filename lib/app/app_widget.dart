import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_interview/app/utils/consts/core_colors.dart';

class AppWidget extends StatelessWidget {
  Widget build(BuildContext context){
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'My Smart App',
      theme: ThemeData(
        scaffoldBackgroundColor: CoreColors.amber100,
        appBarTheme: const AppBarTheme(color: CoreColors.amber600)
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}