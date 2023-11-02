import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/homePage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Transaction',
       theme: ThemeData(
        useMaterial3: true,
       textTheme:GoogleFonts.rubikTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage()
      );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

 

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}