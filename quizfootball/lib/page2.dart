import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'controller.dart';
import 'page3.dart';
import 'record.dart';
class Page2 extends StatelessWidget {
   Page2({super.key});
final QuizController quizController2 = Get.put(QuizController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 195, 191, 120),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              child: TextFormField(
                controller: quizController2.name1,
                keyboardType: TextInputType.name,
                style: TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                          hintText: 'اسم الفريق/اللاعب الاول',hintStyle: TextStyle(color: Colors.black87),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
                          border: OutlineInputBorder(),enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.white70,width:1.5))),
                          ),
              ),
            
            SizedBox(
              height: 30,
            ),
            Container(
              width: 250,
              child: TextFormField(
                controller: quizController2.name2,
                keyboardType: TextInputType.name,
                style: TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                          hintText: 'اسم الفريق/اللاعب الثاني',hintStyle: TextStyle(color: Colors.black87),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
                          border: OutlineInputBorder(),enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.white70,width:1.5))),
                          ),
              ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white70)),
        onPressed: () {
          if (quizController2.name1.text.trim().isEmpty || quizController2.name2.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please enter your team names'),backgroundColor: Colors.red,
          ),
        );
          } else {
        Get.to(Page3());
          }
        },
        child: Text('اذهب لاختيار نوع التحدي',style: TextStyle(color: Colors.black),),
      ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white70)),onPressed: (){Get.to(Record());}, child: Text('سجل التحديات',style: TextStyle(color: Colors.black),)),
      
      ],
        ),
      ),
    );
  }
}