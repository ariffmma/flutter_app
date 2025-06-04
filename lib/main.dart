import 'package:flutter/material.dart';
import 'package:flutter_app/anakata/page/homepage.dart';
import 'package:flutter_app/anakata/navigationroute.dart';
import 'package:flutter_app/ui/pages/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
      home: sign_in(),
    );
  }
}
