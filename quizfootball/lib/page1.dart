import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'Page2.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to( Page2());
    });
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 195, 191, 120),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('تحديات كروية',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30)),
            SizedBox(height: 20),
            Text('نافس وتحدى الجميع في معلوماتك عن كرة القدم',style: TextStyle(color: Colors.black,)),
          ],
        ),
      ),
    );
  }
}