// ignore_for_file: invalid_override_of_non_virtual_member

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Page2.dart';
import 'controller.dart';

class WhoIam extends StatefulWidget {
  const WhoIam({super.key});

  @override
  State<WhoIam> createState() => _WhoIamState();
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WhoIam; // Check if the other object is of the same type
  }

  @override
  int get hashCode => runtimeType.hashCode; 
}

class _WhoIamState extends State<WhoIam> {
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
    randomNumber = random.nextInt(quizController.questions6.length);
  }

  void showNextQuestion() {
    setState(() {
      quizController.questions6.removeAt(randomNumber);
      quizController.currentQuestionIndex++;
      quizController.giveClue2 = false;
      quizController.giveClue3 = false;
      quizController.giveClue4 = false;
      quizController.giveClue5 = false;
      quizController.numberOfHint = 1;
      if (quizController.currentQuestionIndex == int.parse(quizController.dropdownValueDialog[quizController.challenges.indexOf('من أكون')])) {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 195, 191, 120),
        title: Text(
                  'من أكون',
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
      quizController.giveClue2 = false;
      quizController.giveClue3 = false;
      quizController.giveClue4 = false;
      quizController.giveClue5 = false;
      quizController.numberOfHint = 1;
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
            SizedBox(
              height: 20,
            ),
            quizController.currentQuestionIndex <
                    int.parse(quizController.dropdownValueDialog[quizController.challenges.indexOf('من أكون')])
                ? Column(
                    children: [
                      if (showNextQuestionText) Text('اللاعب التالي'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white60,borderRadius: BorderRadius.all(Radius.circular(50))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${quizController.questions6[randomNumber].questionText}',
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
                      quizController.giveClue2 ? 
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white60,borderRadius: BorderRadius.all(Radius.circular(50))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${quizController.questions6[randomNumber].answers[0]}',
                              style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                  textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ) : SizedBox(),
                      quizController.giveClue3 ? 
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white60,borderRadius: BorderRadius.all(Radius.circular(50))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${quizController.questions6[randomNumber].answers[1]}',
                              style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                  textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ) : SizedBox(),
                      quizController.giveClue4 ? 
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white60,borderRadius: BorderRadius.all(Radius.circular(50))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${quizController.questions6[randomNumber].answers[2]}',
                              style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                  textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ) : SizedBox(),
                      quizController.giveClue5 ? 
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white60,borderRadius: BorderRadius.all(Radius.circular(50))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${quizController.questions6[randomNumber].answers[3]}',
                              style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                  textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ) : SizedBox(),
                      ElevatedButton(onPressed: (){
                        setState(() {
                          if (quizController.numberOfHint == 1) {
                        quizController.giveClue2 = true;
                        quizController.numberOfHint++;} 
                        else if (quizController.numberOfHint == 2){
                          quizController.giveClue3 = true;
                          quizController.numberOfHint++;
                        } else if (quizController.numberOfHint == 3) {
                          quizController.giveClue4 = true;
                          quizController.numberOfHint++;
                        } else if (quizController.numberOfHint == 4) {
                          quizController.giveClue5 = true;
                          quizController.numberOfHint++;
                        } 
                        });
                        
                      }, child: Text(quizController.numberOfHint < 5 ? 'اعطي التلميح رقم ${quizController.numberOfHint + 1}' : 'انتهى عدد التلميحات')),
                       SizedBox(
                        height: 5,
                      ),
                      Text('الاجابة الصحيحة'),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Center(
                    child: Text(
                      '${quizController.questions6[randomNumber].answers[4]}',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Text('من الذي أجاب على السؤال أسرع ؟'),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(onPressed: (){
                            setState(() {
                               
                              quizController.scoreA++;
                              showNextQuestion();
                            
                            });
                          }, child: Text('${quizController.name1.text}')),
                          SizedBox(width: 20,),
                          ElevatedButton(onPressed: (){
                            setState(() {
                              quizController.scoreB++;
                              showNextQuestion();
                                
                             
                            });
                            
                          }, child: Text('${quizController.name2.text}')),
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
                    Text('انتهى تحدي من أكون بنتيجة'),
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
                    quizController.challenges.length > quizController.challenges.indexOf('من أكون') + 1 ?
                    ElevatedButton(onPressed: (){quizController.scoreA = 0;
                      quizController.scoreB = 0;
                      quizController.currentQuestionIndex = 0;
                      quizController.giveClue2 = false;
                      quizController.giveClue3 = false;
                      quizController.giveClue4 = false;
                      quizController.giveClue5 = false;
                      quizController.numberOfHint = 1;
                      Get.to(quizController.pages[quizController.challenges.indexOf('من أكون') + 1]);}, child: Text('انتقل إلى التحدي الاخر'))
                    : ElevatedButton(
    onPressed: () {
      quizController.challenges = [];
      quizController.pages = [];
      quizController.dropdownValueDialog = ['3','3','3','3','3'];
      quizController.scoreA = 0;
      quizController.scoreB = 0;
      quizController.currentQuestionIndex = 0;
      quizController.giveClue2 = false;
      quizController.giveClue3 = false;
      quizController.giveClue4 = false;
      quizController.giveClue5 = false;
      quizController.numberOfHint = 1;
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
