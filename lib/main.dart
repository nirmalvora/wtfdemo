import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wtfdemo/core/navigation/navigation_config.dart';
import 'package:wtfdemo/core/navigation/navigation_constant.dart';
import 'package:wtfdemo/ui/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: NavigationRoute.pages,
      initialRoute: NavigationName.home,
      home: HomeScreen(),
    );
  }
}
