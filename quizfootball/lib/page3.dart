import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizfootball/bank.dart';
import 'package:quizfootball/habid.dart';
import 'package:quizfootball/history_player.dart';
import 'package:quizfootball/mazad.dart';
import 'package:quizfootball/page4.dart';
import 'package:quizfootball/quick.dart';
import 'package:quizfootball/risk.dart';
import 'package:quizfootball/who_iam.dart';

import 'controller.dart';

class Page3 extends StatefulWidget {
  Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  final QuizController quizController = Get.put(QuizController());
  List<String> list = <String>['1', '2', '3', '4', '5'];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 195, 191, 120),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: Text(
                  'اختر التحديات التي تريدها',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (quizController.isClicked1) {
                              quizController.isClicked1 = false;
                              quizController.challenges.remove('ماذا تعرف');
                              quizController.clickNumber--;
                              quizController.pages.remove(WhatDidYouKnow());
                            } else if(quizController.clickNumber < 5) {
                              quizController.isClicked1 = true;
                              quizController.challenges.add('ماذا تعرف');
                              quizController.clickNumber++;
                              quizController.pages.add(WhatDidYouKnow());                              
                            }
                          });
                        },
                        child: Text(
                          'تحدي ماذا تعرف',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(120, 40),
                          backgroundColor: quizController.isClicked1
                              ? Colors.green
                              : Color.fromARGB(215, 255, 255, 255),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (quizController.isClicked2) {
                              quizController.isClicked2 = false;
                              quizController.challenges.remove('المزاد');
                              quizController.clickNumber--;
                              quizController.pages.remove(Mazad());
                            } else if(quizController.clickNumber < 5) {
                              quizController.isClicked2 = true;
                              quizController.challenges.add('المزاد');
                              quizController.clickNumber++;
                              quizController.pages.add(Mazad());
                            }
                          });
                        },
                        child: Text(
                          'تحدي المزاد',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(120, 40),
                          backgroundColor: quizController.isClicked2
                              ? Colors.green
                              : Color.fromARGB(215, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (quizController.isClicked3) {
                              quizController.isClicked3 = false;
                              quizController.challenges.remove('السرعة');
                              quizController.clickNumber--;
                              quizController.pages.remove(Quick());
                            } else if(quizController.clickNumber < 5) {
                              quizController.isClicked3 = true;
                              quizController.challenges.add('السرعة');
                              quizController.clickNumber++;
                              quizController.pages.add(Quick());
                            }
                          });
                        },
                        child: Text(
                          'تحدي السرعة',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(120, 40),
                          backgroundColor: quizController.isClicked3
                              ? Colors.green
                              : Color.fromARGB(215, 255, 255, 255),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (quizController.isClicked4) {
                              quizController.isClicked4 = false;
                              quizController.challenges.remove('الهبد');
                              quizController.clickNumber--;
                              quizController.pages.remove(Habid());
                            } else if(quizController.clickNumber < 5) {
                              quizController.isClicked4 = true;
                              quizController.challenges.add('الهبد');
                              quizController.clickNumber++;
                              quizController.pages.add(Habid());
                            }
                          });
                        },
                        child: Text(
                          'تحدي الهبد',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(120, 40),
                          backgroundColor: quizController.isClicked4
                              ? Colors.green
                              : Color.fromARGB(215, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (quizController.isClicked5) {
                              quizController.isClicked5 = false;
                              quizController.challenges.remove('مسيرة اللاعب');
                              quizController.clickNumber--;
                              quizController.pages.remove(HistoryPlayer());
                            } else if(quizController.clickNumber < 5) {
                              quizController.isClicked5 = true;
                              quizController.challenges.add('مسيرة اللاعب');
                              quizController.clickNumber++;
                              quizController.pages.add(HistoryPlayer());
                            }
                          });
                        },
                        child: Text(
                          ' مسيرة اللاعب ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(120, 40),
                          backgroundColor: quizController.isClicked5
                              ? Colors.green
                              : Color.fromARGB(215, 255, 255, 255),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (quizController.isClicked6) {
                              quizController.isClicked6 = false;
                              quizController.challenges.remove('من أكون');
                              quizController.clickNumber--;
                              quizController.pages.remove(WhoIam());
                            } else if(quizController.clickNumber < 5) {
                              quizController.isClicked6 = true;
                              quizController.challenges.add('من أكون');
                              quizController.clickNumber++;
                              quizController.pages.add(WhoIam());
                            }
                          });
                        },
                        child: Text(
                          'تحدي من أكون',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(120, 40),
                          backgroundColor: quizController.isClicked6
                              ? Colors.green
                              : Color.fromARGB(215, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (quizController.isClicked7) {
                              quizController.isClicked7 = false;
                              quizController.challenges.remove('بنك');
                              quizController.clickNumber--;
                              quizController.pages.remove(Bank());
                            } else if (quizController.clickNumber < 5) {
                              quizController.isClicked7 = true;
                              quizController.challenges.add('بنك');
                              quizController.clickNumber++;
                              quizController.pages.add(Bank());
                            }
                          });
                        },
                        child: Text(
                          'تحدي بنك ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(120, 40),
                          backgroundColor: quizController.isClicked7
                              ? Colors.green
                              : Color.fromARGB(215, 255, 255, 255),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (quizController.isClicked8) {
                              quizController.isClicked8 = false;
                              quizController.challenges.remove('ريسك');
                              quizController.clickNumber--;
                              quizController.pages.remove(Risk());
                            } else if(quizController.clickNumber < 5) {
                              quizController.isClicked8 = true;
                              quizController.challenges.add('ريسك');
                              quizController.clickNumber++;
                              quizController.pages.add(Risk());
                            }
                          });
                        },
                        child: Text(
                          'تحدي ريسك',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(120, 40),
                          backgroundColor: quizController.isClicked8
                              ? Colors.green
                              : Color.fromARGB(215, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (quizController.isClicked9) {
                              quizController.isClicked9 = false;
                              quizController.challenges.remove('التمثيل');
                              quizController.clickNumber--;
                            } else if(quizController.clickNumber < 5) {
                              quizController.isClicked9 = true;
                              quizController.challenges.add('التمثيل');
                              quizController.clickNumber++;
                            }
                          });
                        },
                        child: Text(
                          'تحدي التمثيل ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(120, 40),
                          backgroundColor: quizController.isClicked9
                              ? Colors.green
                              : Color.fromARGB(215, 255, 255, 255),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (quizController.isClicked11) {
                              quizController.isClicked11 = false;
                              quizController.challenges.remove('كلمة السر');
                              quizController.clickNumber--;
                            } else if(quizController.clickNumber < 5){
                              quizController.isClicked11 = true;
                              quizController.challenges.add('كلمة السر');
                              quizController.clickNumber++;
                              
                            }
                          });
                        },
                        child: Text(
                          'تحدي كلمة السر  ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(120, 40),
                          backgroundColor: quizController.isClicked11
                              ? Colors.green
                              : Color.fromARGB(215, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 35),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      maximumSize: Size(90, 40),
                      backgroundColor: Color.fromARGB(4, 0, 251, 255),
                    ),
                    onPressed: () {
                      if (quizController.challenges.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('اختر تحدي واحد على الاقل'),backgroundColor: Colors.red,
          ),
        );
                      } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {                         
                          return StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return AlertDialog(
                                title: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Text(
                                    "حدد عدد الاسئلة لكل تحدي",
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                  ),
                                ),
                                content: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        quizController.challenges[0] != 'ريسك' && quizController.challenges[0] != 'بنك' ?
                                        DropdownButton<String>(
                                          value: quizController.dropdownValueDialog[0],
                                          icon: const Icon(Icons.arrow_downward),
                                          style: const TextStyle(color: Colors.black),
                                          underline: Container(
                                            height: 2,
                                            color: Colors.black,
                                          ),
                                          onChanged: (String? value) {
                                            setState(() {
                                              quizController.dropdownValueDialog[0] = value!;
                                            });
                                          },
                                          items: list.map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ) : Text('( لا يمكن تحديد عدد الاسئلة )'),
                                        SizedBox(width: 10),
                                        Text("${quizController.challenges[0]}"),
                                
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                    quizController.challenges.length >= 2 ?
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        quizController.challenges[1] != 'ريسك' && quizController.challenges[1] != 'بنك' ?
                                        DropdownButton<String>(
                                          value: quizController.dropdownValueDialog[1],
                                          icon: const Icon(Icons.arrow_downward),
                                          elevation: 16,
                                          style: const TextStyle(color: Colors.black),
                                          underline: Container(
                                            height: 2,
                                            color: Colors.black,
                                          ),
                                          onChanged: (String? value) {
                                            setState(() {
                                              quizController.dropdownValueDialog[1] = value!;
                                            });
                                          },
                                          items: list.map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ) : Text('( لا يمكن تحديد عدد الاسئلة )'),
                                        SizedBox(width: 10),
                                        Text("${quizController.challenges[1]}"),

                                      ],
                                    ) : 
                                    SizedBox(),
                                    SizedBox(height: 5,),
                                    quizController.challenges.length >= 3 ?
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        quizController.challenges[2] != 'ريسك' && quizController.challenges[2] != 'بنك' ?
                                        DropdownButton<String>(
                                          value: quizController.dropdownValueDialog[2],
                                          icon: const Icon(Icons.arrow_downward),
                                          elevation: 16,
                                          style: const TextStyle(color: Colors.black),
                                          underline: Container(
                                            height: 2,
                                            color: Colors.black,
                                          ),
                                          onChanged: (String? value) {
                                            setState(() {
                                              quizController.dropdownValueDialog[2] = value!;
                                            });
                                          },
                                          items: list.map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ) : Text('( لا يمكن تحديد عدد الاسئلة )'),
                                        SizedBox(width: 10),
                                        Text("${quizController.challenges[2]}"),
                                      ],
                                    ) : 
                                    SizedBox(),
                                    SizedBox(height: 5,),
                                    quizController.challenges.length >= 4 ?
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        quizController.challenges[3] != 'ريسك' && quizController.challenges[3] != 'بنك' ?
                                        DropdownButton<String>(
                                          value: quizController.dropdownValueDialog[3],
                                          icon: const Icon(Icons.arrow_downward),
                                          elevation: 16,
                                          style: const TextStyle(color: Colors.black),
                                          underline: Container(
                                            height: 2,
                                            color: Colors.black,
                                          ),
                                          onChanged: (String? value) {
                                            setState(() {
                                              quizController.dropdownValueDialog[3] = value!;
                                            });
                                          },
                                          items: list.map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ) : Text('( لا يمكن تحديد عدد الاسئلة )'),
                                        SizedBox(width: 10),
                                        Text("${quizController.challenges[3]}"),
                                      ],
                                    ) : 
                                    SizedBox(),
                                    SizedBox(height: 5,),
                                    quizController.challenges.length == 5 ?
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        quizController.challenges[4] != 'ريسك' && quizController.challenges[4] != 'بنك' ?
                                        DropdownButton<String>(
                                          value: quizController.dropdownValueDialog[4],
                                          icon: const Icon(Icons.arrow_downward),
                                          elevation: 16,
                                          style: const TextStyle(color: Colors.black),
                                          underline: Container(
                                            height: 2,
                                            color: Colors.black,
                                          ),
                                          onChanged: (String? value) {
                                            setState(() {
                                              quizController.dropdownValueDialog[4] = value!;
                                            });
                                          },
                                          items: list.map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ) : Text('( لا يمكن تحديد عدد الاسئلة )'),
                                        SizedBox(width: 10),
                                        Text("${quizController.challenges[4]}"),
                                      ],
                                    ) : 
                                    SizedBox(),
                                    SizedBox(height: 60,),
                                    ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
                                      quizController.isClicked1 = false;quizController.isClicked2 = false;quizController.isClicked3 = false;
                                      quizController.isClicked4 = false;quizController.isClicked5 = false;quizController.isClicked6 = false;
                                      quizController.isClicked7 = false;quizController.isClicked8 = false;quizController.isClicked9 = false;
                                      quizController.isClicked11 = false;quizController.clickNumber = 0;
                        Get.to(quizController.pages[0]);
                      
                        // Handle case where pages list is empty
                                    
                      ;}, child: Text('ابدأ التحدي',style: TextStyle(color: Colors.white),))
                                    
                                  ],
                                ),
                                backgroundColor: Color.fromARGB(255, 195, 191, 120),
                                shape: BeveledRectangleBorder(
                                  side: BorderSide(color: Colors.white),
                                ),
                              );
                            },
                          );
                        },
                      );
                      }
                    },
                    child: Row(
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
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
