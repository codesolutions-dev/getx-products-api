import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/home.dart';

/*
   ______________________________________________
  +                                              +
  | Instagram: code_solutions.dev                |
  | Github   : codesolutions-dev                 | 
  +______________________________________________+

 */

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Products Api',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.lightBlue.withOpacity(.4)),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
