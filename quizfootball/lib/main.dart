import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Page1.dart';

void main() {
  runApp(const FootballChallenge());
}

class FootballChallenge extends StatelessWidget {
  const FootballChallenge({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page1(),
    );
}
}