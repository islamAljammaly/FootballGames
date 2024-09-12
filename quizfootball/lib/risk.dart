import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Page2.dart';
import 'controller.dart';

class Risk extends StatefulWidget {
  const Risk({super.key});

  @override
  State<Risk> createState() => _RiskState();
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Risk; // Check if the other object is of the same type
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

class _RiskState extends State<Risk> {
  final QuizController quizController = Get.put(QuizController());
  late int randomNumber;
  bool showNextQuestionText = false;
  late List<List<VoidCallback>> buttonFunctions;
  List<String> pointRisk = ['5','10','20','40'];
   int totalDuration = 60;

  @override
  void initState() {
    super.initState();
    generateRandomNumber(); // Generate a random number when the widget initializes

    buttonFunctions = [
      [
        () => setState(() { quizController.chooseQuestion = 1;quizController.clickedButton[0] = true;quizController.showRow = true;}),
         () => setState(() { quizController.chooseQuestion = 5;quizController.clickedButton[1] = true;quizController.showRow = true;}),
         () => setState(() { quizController.chooseQuestion = 9;quizController.clickedButton[2] = true;quizController.showRow = true;}),
         () => setState(() { quizController.chooseQuestion = 13;quizController.clickedButton[3] = true;quizController.showRow = true;}),
      ],
      [
         () => setState(() { quizController.chooseQuestion = 2;quizController.clickedButton[4] = true;quizController.showRow = true;}),
         () => setState(() { quizController.chooseQuestion = 6;quizController.clickedButton[5] = true;quizController.showRow = true;}),
         () => setState(() { quizController.chooseQuestion = 10;quizController.clickedButton[6] = true;quizController.showRow = true;}),
         () => setState(() { quizController.chooseQuestion = 14;quizController.clickedButton[7] = true;quizController.showRow = true;}),
      ],
      [
         () => setState(() { quizController.chooseQuestion = 3;quizController.clickedButton[8] = true;quizController.showRow = true;}),
         () => setState(() { quizController.chooseQuestion = 7;quizController.clickedButton[9] = true;quizController.showRow = true;}),
         () => setState(() { quizController.chooseQuestion = 11;quizController.clickedButton[10] = true;quizController.showRow = true;}),
         () => setState(() { quizController.chooseQuestion = 15;quizController.clickedButton[11] = true;quizController.showRow = true;}),
      ],
      [
         () => setState(() { quizController.chooseQuestion = 4;quizController.clickedButton[12] = true;quizController.showRow = true;}),
         () => setState(() { quizController.chooseQuestion = 8;quizController.clickedButton[13] = true;quizController.showRow = true;}),
         () => setState(() { quizController.chooseQuestion = 12;quizController.clickedButton[14] = true;quizController.showRow = true;}),
         () => setState(() { quizController.chooseQuestion = 16;quizController.clickedButton[15] = true;quizController.showRow = true;}),
      ],
    ];
  }


  void generateRandomNumber() {
    Random random = Random();
    randomNumber = random.nextInt(quizController.questionTables.length);
  }

  void countdown() async {
    while (quizController.isRunning && quizController.seconds2 > 0) {
      await Future.delayed(Duration(seconds: 1));
      if (quizController.isRunning) {
        setState(() {
          quizController.seconds2--;
          quizController.progress2 = quizController.seconds2 / totalDuration;
        });
      }
    }
    if (quizController.seconds2 == 0) {
      setState(() {
        quizController.timerEnded = true;
      });
    }
  }

  void showNextQuestion() {
    setState(() {
      quizController.currentQuestionIndex++;
      if (quizController.currentQuestionIndex == 16) {
        if (quizController.scoreA > quizController.scoreB) {
          quizController.totalScoreA++;
        } else if (quizController.scoreB > quizController.scoreA) {
          quizController.totalScoreB++;
        } else {
          quizController.totalScoreA++;
          quizController.totalScoreB++;
        }
      }
      showNextQuestionText = true;
      quizController.seconds2 = 60;
      totalDuration = 60;
      quizController.isRunning = false;
      quizController.timerEnded = false;
      quizController.progress2 = 1.0;
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
          'ريسك',
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              quizController.challenges = [];
              quizController.pages = [];
              quizController.dropdownValueDialog = ['3', '3', '3', '3', '3'];
              quizController.scoreA = 0;
              quizController.scoreB = 0;
              quizController.currentQuestionIndex = 0;
              Get.offAll(Page2());
            },
            icon: Icon(Icons.arrow_back)),
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
              height: 5,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: ElevatedButton(onPressed: (){
                    showDialog(context: context, builder: (BuildContext context) {     
                      return StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {                    
                              return AlertDialog(
                                backgroundColor: Color.fromARGB(255, 195, 191, 120),
                                shape: BeveledRectangleBorder(
                                  side: BorderSide(color: Colors.white),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Center(
                                    child: Text(
                                      "حدد كرت المساعدة",
                                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                content: Column(
                                  children: [
                                    ElevatedButton(style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(40,30)),backgroundColor: MaterialStatePropertyAll(quizController.isClicked1? Colors.green : Colors.white70)),onPressed: (){
                                      if(quizController.isClicked1 == false) {
                                        if(quizController.order) {
                                        setState(() {
                                          quizController.questionTables[randomNumber].showChoices[quizController.chooseQuestion - 1] = true;
                                          quizController.isClicked1 = true;
                                        });} else {
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                       content: Text('لا يمكن استخدام هذا الكرت في غير دورك'),backgroundColor: Colors.red,
          ),
        );
                                        }
                                      }
                                    
                                    }, child: Text('خيارات متعددة')),
                                    SizedBox(height: 5,),
                                    ElevatedButton(style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(40,30)),backgroundColor: MaterialStatePropertyAll(quizController.isClicked2? Colors.green : Colors.white70)),onPressed: (){
                                      if(quizController.isClicked2 == false) {
                                      if(quizController.order) {
                                        setState(() {
                                          quizController.seconds2+= 60;
                                          totalDuration = quizController.seconds2;
                                          quizController.progress2 = quizController.seconds2 / totalDuration;
                                          quizController.isClicked2 = true;
                                        });
                                      
                                    }else {
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                       content: Text('لا يمكن استخدام هذا الكرت في غير دورك'),backgroundColor: Colors.red,
          ),
        );
                                        }}
                                    }, child: Text('وقت اضافي')),
                                    SizedBox(height: 5,),
                                    ElevatedButton(style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(40,30)),backgroundColor: MaterialStatePropertyAll(quizController.isClicked3? Colors.green : Colors.white70)),onPressed: (){}, child: Text('سرقة السؤال')),
                                    SizedBox(height: 10,),
                                    ElevatedButton(style: ButtonStyle(maximumSize: MaterialStatePropertyAll(Size(120,40))),onPressed: (){
                                  Navigator.pop(context); }, child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.done,
                          color: Colors.green,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'تم',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),)
                                  ],
                                ));
                            });
                  });}, child: Text('كرت مساعدة'))
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child:
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: ElevatedButton(onPressed: (){}, child: Text('كرت مساعدة'))
                ),
                ),
              ],
            ),
            quizController.currentQuestionIndex < 16
                ? Column(
                    children: [
                      Text(
                        quizController.order
                            ? 'الدور على ${quizController.name1.text}'
                            : 'الدور على ${quizController.name2.text}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      quizController.chooseQuestion != 0 ?
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white60,borderRadius: BorderRadius.all(Radius.circular(50))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${quizController.questionTables[randomNumber].question[quizController.chooseQuestion - 1]}',
                              style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                  textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ) : SizedBox(),
                      quizController.chooseQuestion!= 0 && quizController.questionTables[randomNumber].showChoices[quizController.chooseQuestion - 1] == true ?
                      Column(
                        children: [
                          Text('الخيارات'),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('${quizController.questionTables[randomNumber].multipleChoices[quizController.chooseQuestion - 1][0]}'),
                                Spacer(),
                                Text('${quizController.questionTables[randomNumber].multipleChoices[quizController.chooseQuestion - 1][1]}'),
                                Spacer(),
                                Text('${quizController.questionTables[randomNumber].multipleChoices[quizController.chooseQuestion - 1][2]}'),
                                Spacer(),
                                Text('${quizController.questionTables[randomNumber].multipleChoices[quizController.chooseQuestion - 1][3]}'),
                              ],
                            ),
                          )
                        ],
                      ) : SizedBox(),
                      SizedBox(
                        height: 5,
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
                    child: quizController.chooseQuestion!= 0 ? Text(
                      '${quizController.questionTables[randomNumber].answersTable[quizController.chooseQuestion - 1]}',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ) : SizedBox()
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
              Text('${quizController.seconds2}'), // Display seconds in the center
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
                Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        border: TableBorder.all(),
        children: List.generate(5, (rowIndex) {
          return TableRow(
            children: List.generate(4, (colIndex) {
              final buttonIndex = (rowIndex - 1) * 4 + colIndex;
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: rowIndex == 0 ? Text('${quizController.questionTables[randomNumber].namesRows[colIndex]}') : ElevatedButton(
                  onPressed: buttonFunctions[rowIndex - 1][colIndex],
                  child: Text('${pointRisk[rowIndex - 1]}'),
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(quizController.clickedButton[buttonIndex] ? Colors.green : Colors.white70)),
                ),
              );
            }),
          );
        }),
      ),
    ),
                      SizedBox(
                        height: 20,
                      ),
                      quizController.showRow ?
                      Text('هل أجاب بشكل صحيح ؟',style: TextStyle(fontSize: 20),) : SizedBox(),
                      SizedBox(height: 10,),
                      quizController.showRow ?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(onPressed: (){
                            setState(() {
                                if(quizController.chooseQuestion == 1 || quizController.chooseQuestion == 5 || quizController.chooseQuestion == 9 || quizController.chooseQuestion == 13) {
                                  quizController.order ?
                                quizController.scoreA+= 5 : quizController.scoreB+=5;
                                } else if(quizController.chooseQuestion == 2 || quizController.chooseQuestion == 6 || quizController.chooseQuestion == 10 || quizController.chooseQuestion == 14 ) {
                                  quizController.order ?
                                quizController.scoreA+= 10 : quizController.scoreB+=10;
                                }else if(quizController.chooseQuestion == 3 || quizController.chooseQuestion == 7 || quizController.chooseQuestion == 11 || quizController.chooseQuestion == 15 ) {
                                  quizController.order ?
                                quizController.scoreA+= 20 : quizController.scoreB+=20;
                                }else if(quizController.chooseQuestion == 4 || quizController.chooseQuestion == 8 || quizController.chooseQuestion == 12 || quizController.chooseQuestion == 16) {
                                  quizController.order ?
                                quizController.scoreA+= 40 : quizController.scoreB+=40;
                                }
                                quizController.showRow = false;
                              quizController.order ? quizController.order = false : quizController.order = true;
                              showNextQuestion();
                            });
                          }, child: Text('صح')),
                          SizedBox(width: 20,),
                          ElevatedButton(onPressed: (){
                            setState(() {
                              quizController.showRow = false;
                              quizController.order ? quizController.order = false : quizController.order = true;
                              showNextQuestion();
                            });
                          }, child: Text('خطأ')),
                        ],
                      ) : SizedBox()
                    ],
                  )
                : Column(
                  children: [
                    Text('انتهى تحدي ربسك بنتيجة'),
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
                    quizController.challenges.length > quizController.challenges.indexOf('ريسك') + 1 ?
                    ElevatedButton(onPressed: (){
                      quizController.scoreA = 0;
                      quizController.scoreB = 0;
                      quizController.currentQuestionIndex = 0;
                      Get.to(quizController.pages[quizController.challenges.indexOf('ريسك') + 1]);
                    }, child: Text('انتقل إلى التحدي الاخر'))
                    : ElevatedButton(
                      onPressed: () {
                        quizController.challenges = [];
                        quizController.pages = [];
                        quizController.dropdownValueDialog = ['3', '3', '3', '3', '3'];
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
