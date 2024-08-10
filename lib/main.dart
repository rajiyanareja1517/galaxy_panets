import 'package:flutter/material.dart';
import 'package:galaxy_planets/models/planets_des_model.dart';
import 'package:galaxy_planets/views/screens/details_screen.dart';
import 'package:galaxy_planets/views/screens/home_screen.dart';
import 'package:galaxy_planets/views/screens/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => SplashScreen(),),
        GetPage(name: '/home_screen', page: () => HomeScreen(),),
        GetPage(name: '/details_screen', page: () => DetailsScreen(),)

      ],
    );
  }
}

