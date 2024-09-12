// ignore_for_file: invalid_override_of_non_virtual_member

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'Page2.dart';
import 'controller.dart';

class Mazad extends StatefulWidget {
  const Mazad({super.key});

  @override
  State<Mazad> createState() => _MazadState();
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Mazad; // Check if the other object is of the same type
  }

  @override
  int get hashCode => runtimeType.hashCode; 
}

class _MazadState extends State<Mazad> {
  @override
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
    randomNumber = random.nextInt(quizController.questions2.length);
    isSelected = List<bool>.filled(quizController.questions2[randomNumber].answers.length, false);
  }
 void countdown() async {
    while (quizController.isRunning && quizController.seconds > 0) {
      await Future.delayed(Duration(seconds: 1));
      if (quizController.isRunning) {
        setState(() {
          quizController.seconds--;
          quizController.progress = quizController.seconds / 30;
        });
      }
    }
    if (quizController.seconds == 0) {
      setState(() {
        quizController.timerEnded = true;
      });
    }
  }

  void showNextQuestion() {
    setState(() {
      quizController.questions2.removeAt(randomNumber);
      quizController.currentQuestionIndex++;
      if (quizController.currentQuestionIndex == int.parse(quizController.dropdownValueDialog[quizController.challenges.indexOf('المزاد')])) {
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
      quizController.answerUser = 0;
      quizController.goalNumber = 0;
      quizController.seconds = 30;
      quizController.isRunning = false;
      quizController.timerEnded = false;
      quizController.progress = 1.0;
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
                    isSelected[j] = !isSelected[j];
                    if(isSelected[j]) {
                    quizController.answerUser++;
                     }else {
                      quizController.answerUser--;
                     } // Toggle the selected state
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
                  'المزاد',
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
            quizController.currentQuestionIndex <
                    int.parse(quizController.dropdownValueDialog[quizController.challenges.indexOf('المزاد')])
                ? Column(
                    children: [
              Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          FloatingActionButton(heroTag: "btn1",mini: true,backgroundColor: Colors.black,child: Icon(Icons.remove),onPressed: (){setState(() {
                            if (quizController.counter1 > 0) {
                            quizController.counter1--;
                            }
                          });}),
                          SizedBox(width: 5,),
                          Text('${quizController.counter1}'),
                          SizedBox(width: 5,),
                          FloatingActionButton(heroTag: "btn2",mini: true,backgroundColor: Colors.black,child: Icon(Icons.add),onPressed: (){setState(() {
                            quizController.counter1++;
                          });}),
                        ],
                      )
                    ),
                    SizedBox(height: 5,),
                    Padding(padding: EdgeInsets.only(left: 15),child: ElevatedButton(onPressed: (){setState(() {
                      quizController.order = false;
                      quizController.goalNumber = quizController.counter2;
                    });},child: Text('Pass'),style: ElevatedButton.styleFrom(backgroundColor: Colors.black),),),

                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                child: CircularProgressIndicator(
                  value: quizController.progress, // Bind progress value reactively
                  backgroundColor: Colors.grey,
                  color: Colors.blue,
                  strokeWidth: 8,
                ),
              ),
              Text('${quizController.seconds}'), // Display seconds in the center
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
                          if((quizController.counter1 > 0 || quizController.counter2 > 0) && (quizController.counter1 != quizController.counter2)) {
                          if(quizController.counter1 > quizController.counter2) {
                            quizController.order = true;
                          } else {
                            quizController.order = false;
                          }
                          if (!quizController.isRunning) {
                          quizController.isRunning = true;
                          quizController.timerEnded = false;
                          quizController.counter1 > quizController.counter2 ?
                          quizController.goalNumber = quizController.counter1 : quizController.goalNumber = quizController.counter2;
                          countdown();
                        }
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
                Spacer(),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        children: [
                          FloatingActionButton(heroTag: "btn3",backgroundColor: Colors.black,mini: true,child: Icon(Icons.remove),onPressed: (){setState(() {
                            if (quizController.counter2 > 0) {
                            quizController.counter2--;
                            }
                          });}),
                          SizedBox(width: 5,),
                          Text('${quizController.counter2}'),
                          SizedBox(width: 5,),
                          FloatingActionButton(heroTag: "btn4",backgroundColor: Colors.black,mini: true,child: Icon(Icons.add),onPressed: (){setState(() {
                            quizController.counter2++;
                          });}),
                        ],
                      )
                    ),
                    SizedBox(height: 5,),
                    Padding(padding: EdgeInsets.only(right: 15),child: ElevatedButton(onPressed: (){
                      setState(() {
                        quizController.order = true;
                        quizController.goalNumber = quizController.counter1;
                      });
                      }, child: Text('Pass'),style: ElevatedButton.styleFrom(backgroundColor: Colors.black),),),

                  ],
                ),
              ],
            ), 
            quizController.currentQuestionIndex <
                int.parse(quizController.dropdownValueDialog[quizController.challenges.indexOf('المزاد')])
            ?
            Text(
                    quizController.order
                        ? 'الاجابات الصحيحة ل${quizController.name1.text} ${quizController.answerUser}/${quizController.goalNumber}'
                        : 'الاجابات الصحيحة ل${quizController.name2.text} ${quizController.answerUser}/${quizController.goalNumber}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ) : SizedBox(),       
                      if (showNextQuestionText) Text('السؤال التالي'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white60,borderRadius: BorderRadius.all(Radius.circular(50))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${quizController.questions2[randomNumber].questionText}',
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
                            quizController.questions2[randomNumber].answers),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(onPressed: (){
                            setState(() {
                               if (quizController.order) {
                            quizController.scoreB++;
                            } else {
                              quizController.scoreA++;
                            }
                              showNextQuestion();
                              quizController.counter1 = 0;
                              quizController.counter2 = 0;
                            quizController.order = !quizController.order;
                            });
                          }, child: Text('لم يستطع الاجابة')),
                          SizedBox(width: 20,),
                          ElevatedButton(onPressed: (){
                            setState(() {
                                if (quizController.order == false) {
                                  quizController.scoreB++;
                                } else if(quizController.order) {
                                  quizController.scoreA++;
                                }
                                showNextQuestion();
                                quizController.counter1 = 0;
                                quizController.counter2 = 0;
                              quizController.order = !quizController.order;
                            });
                          }, child: Text('تمت الاجابة بشكل صحيح')),
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
                    Text('انتهى تحدي المزاد بنتيجة'),
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
                    quizController.challenges.length > quizController.challenges.indexOf('المزاد') + 1 ?
                    ElevatedButton(onPressed: (){quizController.scoreA = 0;
                      quizController.scoreB = 0;
                      quizController.currentQuestionIndex = 0;
                      Get.to(quizController.pages[quizController.challenges.indexOf('المزاد') + 1]);}, child: Text('انتقل إلى التحدي الاخر'))
                    : ElevatedButton(
    onPressed: () {
      quizController.challenges = [];
      quizController.pages = [];
      quizController.dropdownValueDialog = ['3','3','3','3','3'];
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
