// ignore_for_file: invalid_override_of_non_virtual_member

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Page2.dart';
import 'controller.dart';

class Bank extends StatefulWidget {
  const Bank({super.key});

  @override
  State<Bank> createState() => _BankState();
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Bank; // Check if the other object is of the same type
  }

  @override
  int get hashCode => runtimeType.hashCode; 
}

class _BankState extends State<Bank> {
  final QuizController quizController = Get.put(QuizController());
  late int randomNumber;
  bool showNextQuestionText = false;
  

  @override
  void initState() {
    super.initState();
    generateRandomNumber(); // Generate a random number when the widget initializes
  }

  void generateRandomNumber() {
    Random random = Random();
    randomNumber = random.nextInt(quizController.questions7.length);
  }

  void countdown() async {
    while (quizController.isRunning && quizController.seconds3 > 0) {
      await Future.delayed(Duration(seconds: 1));
      if (quizController.isRunning) {
        setState(() {
          quizController.seconds3--;
          quizController.progress2 = quizController.seconds3 / 120;
        });
      }
    }
    if (quizController.seconds3 == 0) {
      setState(() {
        quizController.timerEnded = true;
      });
    }
  }

  void showNextQuestion() {
    setState(() {
      quizController.questions7.removeAt(randomNumber);
      quizController.currentQuestionIndex++;
      quizController.addCounter = true;
      if (quizController.currentQuestionIndex == 5 && quizController.order == false || quizController.seconds3 == 0 && quizController.order == false) {
        quizController.currentQuestionIndex = 6;
        quizController.scoreB = quizController.bank;
        if(quizController.scoreA > quizController.scoreB) {
          quizController.totalScoreA++;
        } else if (quizController.scoreB > quizController.scoreA){
          quizController.totalScoreB++;
        } else {
          quizController.totalScoreA++;
          quizController.totalScoreB++;
        }
      }
      if(quizController.currentQuestionIndex == 5 && quizController.order || quizController.seconds3 == 0 && quizController.order) {
         quizController.seconds3 = 120;
         quizController.isRunning = false;
         quizController.timerEnded = false;
         quizController.progress2 = 1.0;
           quizController.currentQuestionIndex = 0;
         quizController.scoreA = quizController.bank;
         quizController.order = false;
         quizController.counter = 0;
         quizController.bank = 0;        
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 195, 191, 120),
        title: Text(
                  'بنك',
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
      quizController.scoreA = 0;
      quizController.scoreB = 0;
      quizController.currentQuestionIndex = 0;
       quizController.seconds3 = 120;
         quizController.isRunning = false;
         quizController.timerEnded = false;
         quizController.progress2 = 1.0;
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                quizController.order
                    ? Icon(Icons.arrow_back, size: 50, color: Colors.black)
                    : Icon(Icons.arrow_forward, size: 50, color: Colors.black),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            quizController.currentQuestionIndex < 5
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
                              '${quizController.questions7[randomNumber].questionText}',
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
                      Text('الاجابة الصحيحة'),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Center(
                    child: Text(
                      '${quizController.questions7[randomNumber].answers[0]}',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Column(
                  children: [
                    Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                child: CircularProgressIndicator(
                  value: quizController.progress2, // Bind progress value reactively
                  backgroundColor: Colors.grey,
                  color: Colors.blue,
                  strokeWidth: 8,
                ),
              ),
              Text('${quizController.seconds3}'), // Display seconds in the center
            ],
          ),
              SizedBox(height: 15),
              SizedBox(
                width: 120,
                height: 35,
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {                                          
                          if (!quizController.isRunning) {
                          quizController.isRunning = true;
                          quizController.timerEnded = false;
                          countdown();                         
                        }                        
                        });                     
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.not_started_outlined),
                          SizedBox(width: 3,),
                          Text('ابدأ الوقت',style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 120,
                height: 35,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      quizController.isRunning = false;
                    });                   
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.pause),
                      SizedBox(width: 3,),
                      Text('ايقاف',style: TextStyle(fontSize: 17),),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              if (quizController.timerEnded)
                Text(
                  'انتهى الوقت',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
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
                              if(quizController.addCounter) {                   
                              quizController.counter++;
                              if(quizController.counter > 1) {
                                quizController.counter = quizController.counter*2;
                              }
                              }
                              quizController.addCounter = false;
                            });
                          }, child: Text('اجابة صحيحة')),
                          SizedBox(width: 20,),
                          ElevatedButton(onPressed: (){
                            setState(() {
                              quizController.counter = 0;       
                            });
                          }, child: Text('اجابة خاطئة')),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(onPressed: (){
                            setState(() {
                              showNextQuestion(); 
                            });
                          }, child: Text("الانتقال الى السؤال التالي")),
                          SizedBox(width: 40,),
                          ElevatedButton(onPressed: (){
                            setState(() {
                              quizController.bank += quizController.counter;
                              quizController.counter = 0;
                            });
                          }, child: Text("بنك")),
                    ],
                    
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text('counter'),
                          SizedBox(height: 5,),
                          Container(
                            width: 80,
                            height: 40,
                            decoration: BoxDecoration(shape: BoxShape.rectangle,border: Border.all(color: Colors.black, width: 2)),
                            child: Center(child: Text('${quizController.counter}')),
                          )
                        ],
                      ),
                      SizedBox(width: 50),
                      Column(
                        children: [
                          Text('Bank'),
                          SizedBox(height: 5,),
                          Container(
                            width: 80,
                            height: 40,
                            decoration: BoxDecoration(shape: BoxShape.rectangle,border: Border.all(color: Colors.black, width: 2)),
                            child: Center(child: Text('${quizController.bank}')),
                          )
                        ],
                      )
                    ],
                  )])
                : Column(
                  children: [
                    Text('انتهى تحدي بنك بنتيجة'),
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
                    quizController.challenges.length > quizController.challenges.indexOf('بنك') + 1 ?
                    ElevatedButton(onPressed: (){quizController.scoreA = 0;
                      quizController.scoreB = 0;
                      quizController.currentQuestionIndex = 0;
                       quizController.seconds3 = 120;
         quizController.isRunning = false;
         quizController.timerEnded = false;
         quizController.progress2 = 1.0;
                      Get.to(quizController.pages[quizController.challenges.indexOf('بنك') + 1]);}, child: Text('انتقل إلى التحدي الاخر'))
                    : ElevatedButton(
    onPressed: () {
      quizController.challenges = [];
      quizController.pages = [];
      quizController.dropdownValueDialog = ['3','3','3','3','3'];
      quizController.scoreA = 0;
      quizController.scoreB = 0;
      quizController.currentQuestionIndex = 0;
       quizController.seconds3 = 120;
         quizController.isRunning = false;
         quizController.timerEnded = false;
         quizController.progress2 = 1.0;
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
