// ignore_for_file: invalid_override_of_non_virtual_member

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Page2.dart';
import 'controller.dart';

class WhatDidYouKnow extends StatefulWidget {
  const WhatDidYouKnow({super.key});

  @override
  State<WhatDidYouKnow> createState() => _WhatDidYouKnowState();
   @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WhatDidYouKnow; // Check if the other object is of the same type
  }

  @override
  int get hashCode => runtimeType.hashCode; 
}

class _WhatDidYouKnowState extends State<WhatDidYouKnow> {
  final QuizController quizController = Get.put(QuizController());
  late int randomNumber;
  bool showNextQuestionText = false;
  late List<bool> isSelected;

  @override
  void initState() {
    super.initState();
    generateRandomNumber(); // Generate a random number when the widget initializes
  }
  
  void generateRandomNumber() {
    Random random = Random();
    randomNumber = random.nextInt(quizController.questions.length);
    isSelected = List<bool>.filled(quizController.questions[randomNumber].answers.length, false);
  }

  void showNextQuestion() {
    setState(() {
      quizController.questions.removeAt(randomNumber);
      quizController.iconErrors1 = [];
      quizController.iconErrors2 = [];
      quizController.currentQuestionIndex++;
      if (quizController.currentQuestionIndex == int.parse(quizController.dropdownValueDialog[quizController.challenges.indexOf('ماذا تعرف')])) {
        if(quizController.scoreA > quizController.scoreB) {
          quizController.totalScoreA++;
        } else if (quizController.scoreB > quizController.scoreA){
          quizController.totalScoreB++;
        } else {
          quizController.totalScoreA++;
          quizController.totalScoreB++;
        }
      }
      showNextQuestionText = true;
      generateRandomNumber();
    });

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        showNextQuestionText = false;
      });
    });
  }

  List<Widget> buildAnswerButtons(List<String> answers) {
    List<Widget> rows = [];
    for (int i = 0; i < answers.length; i += 4) {
      List<Widget> rowChildren = [];
      for (int j = i; j < i + 4 && j < answers.length; j++) {
        rowChildren.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: SizedBox(
              width: 90, // Set a fixed width for each button
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected[j] ? Colors.green : Colors.white70,
                  // Set button color based on state
                ),
                onPressed: () {
                  setState(() {
                    isSelected[j] = !isSelected[j]; // Toggle the selected state
                  });
                },
                child: Text(
                  answers[j],
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        );
      }
      rows.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the row
          children: rowChildren,
        ),
      ));
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 195, 191, 120),
        title: Text(
                  'ماذا تعرف',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                elevation: 0,
                leading: IconButton(onPressed: (){quizController.challenges = [];
      quizController.pages = [];
      quizController.dropdownValueDialog = ['3','3','3','3','3'];
      quizController.iconErrors1 = [];
      quizController.iconErrors2 = [];
      quizController.scoreA = 0;
      quizController.scoreB = 0;
      quizController.currentQuestionIndex = 0;
      Get.offAll(Page2());}, icon: Icon(Icons.arrow_back)),
                
      ),
      backgroundColor: Color.fromARGB(255, 195, 191, 120),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Center(
                    child: Text(
                      '${quizController.scoreA}',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Center(
                    child: Text(
                      '${quizController.scoreB}',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    '${quizController.name1.text}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    '${quizController.name2.text}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(quizController.iconErrors1.join(' '),
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                    quizController.iconErrors2.join(''),
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            quizController.currentQuestionIndex <
                    int.parse(quizController.dropdownValueDialog[quizController.challenges.indexOf('ماذا تعرف')])
                ? Column(
                    children: [
                      if (showNextQuestionText) Text('السؤال التالي'),
                      Text(
                        quizController.order
                            ? 'الدور على ${quizController.name1.text}'
                            : 'الدور على ${quizController.name2.text}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white60,borderRadius: BorderRadius.all(Radius.circular(50))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${quizController.questions[randomNumber].questionText}',
                              style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                  textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('الاجابات الصحيحة'),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: buildAnswerButtons(
                            quizController.questions[randomNumber].answers),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(onPressed: (){
                            setState(() {
                               if (quizController.order) {
                            quizController.iconErrors1.add('X');
                            } else {
                              quizController.iconErrors2.add('X');
                            }
                            if(quizController.iconErrors1.length == 3) {
                              quizController.scoreB++;
                              
                              showNextQuestion();
                            } else if (quizController.iconErrors2.length == 3){
                              quizController.scoreA++;
                              
                              showNextQuestion();
                            }
                            quizController.order = !quizController.order;
                            });
                          }, child: Text('إجابة خاطئة')),
                          SizedBox(width: 20,),
                          ElevatedButton(onPressed: (){
                            setState(() {
                              if(isSelected.every((element) => element == true)) {
                                if (quizController.iconErrors1.length > quizController.iconErrors2.length) {
                                  quizController.scoreB++;
                                } else if(quizController.iconErrors1.length < quizController.iconErrors2.length) {
                                  quizController.scoreA++;
                                } else {
                                  quizController.scoreA++;
                                  quizController.scoreB++;
                                }
                                
                                showNextQuestion();
                              }
                              quizController.order = !quizController.order;
                            });
                            
                          }, child: Text('إجابة صحيحة')),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(onPressed: (){
                            setState(() {
                              quizController.currentQuestionIndex--;
                              showNextQuestion(); 
                            });
                          }, child: Row(children: [Icon(Icons.repeat_on,size: 20),SizedBox(width: 5,),Text("غير السؤال")],)),
                        ],
                      )
                    ],
                    
                  )
                : Column(
                  children: [
                    Text('انتهى تحدي ماذا تعرف بنتيجة'),
                    SizedBox(
                      height: 10,
                      
                    ),
                    Text('${quizController.name1.text} : ${quizController.scoreA}'),
                    SizedBox(
                      height: 5,
                    ),
                    Text('${quizController.name2.text} : ${quizController.scoreB}'),
                    SizedBox(height: 10,),
                    Text('والنتيجة الكلية هي'),
                    SizedBox(
                      height: 5,
                    ),
                    Text('${quizController.name1.text} : ${quizController.totalScoreA}'),
                    SizedBox(
                      height: 5,
                    ),
                    Text('${quizController.name2.text} : ${quizController.totalScoreB}'),
                    SizedBox(
                      height: 30,
                    ),
                    quizController.challenges.length > quizController.challenges.indexOf('ماذا تعرف') + 1 ?
                    ElevatedButton(onPressed: (){quizController.scoreA = 0;
                      quizController.scoreB = 0;
                      quizController.currentQuestionIndex = 0;
                      Get.to(quizController.pages[quizController.challenges.indexOf('ماذا تعرف') + 1]);}, child: Text('انتقل إلى التحدي الاخر'))
                    : ElevatedButton(
    onPressed: () {
      quizController.challenges = [];
      quizController.pages = [];
      quizController.dropdownValueDialog = ['3','3','3','3','3'];
      quizController.iconErrors1 = [];
      quizController.iconErrors2 = [];
      quizController.scoreA = 0;
      quizController.scoreB = 0;
      quizController.currentQuestionIndex = 0;
      Get.offAll(Page2());
    },
    child: Text('الصفحة الرئيسية'),
  ),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
