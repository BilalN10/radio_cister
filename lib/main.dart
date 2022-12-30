import 'package:flutter/material.dart';

import 'package:radio_app/check_just_audio.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rádio Cister',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CheckAudio(),
      );
    });
  }
}
