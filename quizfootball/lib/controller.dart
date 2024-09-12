import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizfootball/mazad.dart';
import 'package:quizfootball/page4.dart';

class QuizController extends GetxController {
  final TextEditingController name1 = TextEditingController();
  final TextEditingController name2 = TextEditingController();

  bool showRow = false;
  bool isClicked1 = false;
  bool isClicked2 = false;
  bool isClicked3 = false;
  bool isClicked4 = false;
  bool isClicked5 = false;
  bool isClicked6 = false;
  bool isClicked7 = false;
  bool isClicked8 = false;
  bool isClicked9 = false;
  bool isClicked11 = false;
  List<bool> clickedButton = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];
  bool addCounter = true;
  int counter = 0;
  int bank = 0;
  int numberOfHint = 1;
  bool giveClue2 = false;
  bool giveClue3 = false;
  bool giveClue4 = false;
  bool giveClue5 = false;
  int seconds = 30;
  bool isRunning = false;
   bool timerEnded = false;
   int answerUser = 0;
   int goalNumber = 0;
   int seconds2 = 60;
   var progress2 = 1.0;
   int seconds3 = 120;

  List<String> challenges = [];
  int clickNumber = 0;
  
  List<String> dropdownValueDialog = ['3','3','3','3','3'];
  int chooseQuestion = 0;
  int scoreA = 0;
  int scoreB = 0;
  int totalScoreA = 0;
  int totalScoreB = 0;
  var progress = 1.0;
  List<Widget> pages = [];
  List<String> iconErrors1 = [];
  List<String> iconErrors2 = [];
  int currentQuestionIndex = 0;
  bool order = true;

 int counter1 = 0;
 int counter2 = 0;


  

  final questions = [
    Question('لاعبين لعبوا في نادي ريال مدريد عبر التاريخ', ['زيدان','كاسياس','رونالدو','بنزيما','راموس','مودريتش']),
    Question('لاعبين لعبوا في نادي برشلونة عبر التاريخ', ['رونالدو','بنزيما','راموس','مودريتش']),
    Question('لاعبين لعبوا في نادي بايرن ميونخ عبر التاريخ',['كاسياس','رونالدو','بنزيما','راموس','مودريتش']),
    Question('لاعبين لعبوا في نادي ارسنال عبر التاريخ',['كاسياس','رونالدو','بنزيما','راموس','مودريتش']),
    Question('لاعبين لعبوا في نادي مانشستر يونايتد عبر التاريخ',['كاسياس','رونالدو','بنزيما','راموس','مودريتش']),
  ];
  final questions2 = [
    Question('كم لاعب لعب لنادي ريال مدريد عبر التاريخ تقدر تذكر في 30 ثانية', ['زيدان','كاسياس','رونالدو','بنزيما','راموس','مودريتش']),
    Question('كم لاعب لعب في نادي برشلونة عبر التاريخ تقدر تذكر في 30 ثانية', ['رونالدو','بنزيما','راموس','مودريتش']),
    Question('كم لاعب لعب في نادي بايرن ميونخ عبر التاريخ تقدر تذكر في 30 ثانية',['كاسياس','رونالدو','بنزيما','راموس','مودريتش']),
    Question('كم لاعب لعب في نادي ارسنال عبر التاريخ تقدر تذكر في 30 ثانية',['كاسياس','رونالدو','بنزيما','راموس','مودريتش']),
    Question('كم لاعب لعب في نادي مانشستر يونايتد عبر التاريخ تقدر تذكر في 30 ثانية',['كاسياس','رونالدو','بنزيما','راموس','مودريتش']),
  ];
  final questions3 = [
    Question('كم لاعب لعب لنادي ريال مدريد عبر التاريخ تقدر تذكر في 30 ثانية', ['رونالدو']),
    Question('كم لاعب لعب في نادي برشلونة عبر التاريخ تقدر تذكر في 30 ثانية', ['17']),
    Question('كم لاعب لعب في نادي بايرن ميونخ عبر التاريخ تقدر تذكر في 30 ثانية',['4']),
    Question('كم لاعب لعب في نادي ارسنال عبر التاريخ تقدر تذكر في 30 ثانية',['كاسياس']),
    Question('كم لاعب لعب في نادي مانشستر يونايتد عبر التاريخ تقدر تذكر في 30 ثانية',['ميسي']),
  ];

  final questions4 = [
    Question('كم لاعب لعب لنادي ريال مدريد عبر التاريخ تقدر تذكر في 30 ثانية', ['رونالدو']),
    Question('كم لاعب لعب في نادي برشلونة عبر التاريخ تقدر تذكر في 30 ثانية', ['17']),
    Question('كم لاعب لعب في نادي بايرن ميونخ عبر التاريخ تقدر تذكر في 30 ثانية',['4']),
    Question('كم لاعب لعب في نادي ارسنال عبر التاريخ تقدر تذكر في 30 ثانية',['كاسياس']),
    Question('كم لاعب لعب في نادي مانشستر يونايتد عبر التاريخ تقدر تذكر في 30 ثانية',['ميسي']),
  ];

  final questions5 = [
    Question('بوردو (الفرنسي) - اشبيلية (الاسباني) - برشلونة (الاسباني)', ['كوندي']),
    Question('موناكو (الفرنسي) - باريس سان جيرمان (الفرنسي) - ريال مدريد (الاسباني)', ['مبابي']),
    Question('برشلونة (الاسباني) - باريس سان جيرمان (الفرنسي) - انتر ميامي (الامريكي)',['ميسي']),
    Question('برينتفورد (الانجليزي) - ارسنال (الانجليزي)',['رايا']),
    Question('بوروسيا دورتموند (الالماني) - بايرن ميونخ ( الالماني) - برشلونة (الاسباني)',['ليفاندوسكي']),
  ];

  final questions6 = [
    Question('أنا لاعب حالي , لعبت بجانب ميسي ورونالدو ونيمار وخاميس رودريغيز', ['حققت لقب الدوري الاسباني','لعبت مع فريق فالنسيا وبرشلونة في الدوري الاسباني','دربني لويس انريكي وكارلو أنشيلوتي','لعبت مع نادي ايفرتون الانجليزي','اندري غوميز']),
    Question('أنا لاعب حالي , لعبت بجانب ميسي ورونالدو ونيمار وخاميس رودريغيز', ['حققت لقب الدوري الاسباني','لعبت مع فريق فالنسيا وبرشلونة في الدوري الاسباني','دربني لويس انريكي وكارلو أنشيلوتي','لعبت مع نادي ايفرتون الانجليزي','اندري غوميز']),
    Question('أنا لاعب حالي , لعبت بجانب ميسي ورونالدو ونيمار وخاميس رودريغيز', ['حققت لقب الدوري الاسباني','لعبت مع فريق فالنسيا وبرشلونة في الدوري الاسباني','دربني لويس انريكي وكارلو أنشيلوتي','لعبت مع نادي ايفرتون الانجليزي','اندري غوميز']),
    Question('أنا لاعب حالي , لعبت بجانب ميسي ورونالدو ونيمار وخاميس رودريغيز', ['حققت لقب الدوري الاسباني','لعبت مع فريق فالنسيا وبرشلونة في الدوري الاسباني','دربني لويس انريكي وكارلو أنشيلوتي','لعبت مع نادي ايفرتون الانجليزي','اندري غوميز']),
    Question('أنا لاعب حالي , لعبت بجانب ميسي ورونالدو ونيمار وخاميس رودريغيز', ['حققت لقب الدوري الاسباني','لعبت مع فريق فالنسيا وبرشلونة في الدوري الاسباني','دربني لويس انريكي وكارلو أنشيلوتي','لعبت مع نادي ايفرتون الانجليزي','اندري غوميز']),

  ];
  final questions7 = [
    Question('كم لاعب لعب لنادي ريال مدريد عبر التاريخ تقدر تذكر في 30 ثانية', ['رونالدو']),
    Question('كم لاعب لعب في نادي برشلونة عبر التاريخ تقدر تذكر في 30 ثانية', ['17']),
    Question('كم لاعب لعب في نادي بايرن ميونخ عبر التاريخ تقدر تذكر في 30 ثانية',['4']),
    Question('كم لاعب لعب في نادي ارسنال عبر التاريخ تقدر تذكر في 30 ثانية',['كاسياس']),
    Question('كم لاعب لعب في نادي مانشستر يونايتد عبر التاريخ تقدر تذكر في 30 ثانية',['ميسي']),
    Question('كم لاعب لعب لنادي ريال مدريد عبر التاريخ تقدر تذكر في 30 ثانية', ['رونالدو']),
    Question('كم لاعب لعب في نادي برشلونة عبر التاريخ تقدر تذكر في 30 ثانية', ['17']),
    Question('كم لاعب لعب في نادي بايرن ميونخ عبر التاريخ تقدر تذكر في 30 ثانية',['4']),
    Question('كم لاعب لعب في نادي ارسنال عبر التاريخ تقدر تذكر في 30 ثانية',['كاسياس']),
    Question('كم لاعب لعب في نادي مانشستر يونايتد عبر التاريخ تقدر تذكر في 30 ثانية',['ميسي']),
    Question('كم لاعب لعب لنادي ريال مدريد عبر التاريخ تقدر تذكر في 30 ثانية', ['رونالدو']),
    Question('كم لاعب لعب في نادي برشلونة عبر التاريخ تقدر تذكر في 30 ثانية', ['17']),
    Question('كم لاعب لعب في نادي بايرن ميونخ عبر التاريخ تقدر تذكر في 30 ثانية',['4']),
    Question('كم لاعب لعب في نادي ارسنال عبر التاريخ تقدر تذكر في 30 ثانية',['كاسياس']),
    Question('كم لاعب لعب في نادي مانشستر يونايتد عبر التاريخ تقدر تذكر في 30 ثانية',['ميسي']),
  ];

  final questions8 = [
    Question('كم لاعب لعب لنادي ريال مدريد عبر التاريخ تقدر تذكر في 30 ثانية', ['رونالدو']),
    Question('كم لاعب لعب في نادي برشلونة عبر التاريخ تقدر تذكر في 30 ثانية', ['17']),
    Question('كم لاعب لعب في نادي بايرن ميونخ عبر التاريخ تقدر تذكر في 30 ثانية',['4']),
    Question('كم لاعب لعب في نادي ارسنال عبر التاريخ تقدر تذكر في 30 ثانية',['كاسياس']),
    Question('كم لاعب لعب في نادي مانشستر يونايتد عبر التاريخ تقدر تذكر في 30 ثانية',['ميسي']),
    Question('كم لاعب لعب لنادي ريال مدريد عبر التاريخ تقدر تذكر في 30 ثانية', ['رونالدو']),
    Question('كم لاعب لعب في نادي برشلونة عبر التاريخ تقدر تذكر في 30 ثانية', ['17']),
    Question('كم لاعب لعب في نادي بايرن ميونخ عبر التاريخ تقدر تذكر في 30 ثانية',['4']),
    Question('كم لاعب لعب في نادي ارسنال عبر التاريخ تقدر تذكر في 30 ثانية',['كاسياس']),
    Question('كم لاعب لعب في نادي مانشستر يونايتد عبر التاريخ تقدر تذكر في 30 ثانية',['ميسي']),
    Question('كم لاعب لعب لنادي ريال مدريد عبر التاريخ تقدر تذكر في 30 ثانية', ['رونالدو']),
    Question('كم لاعب لعب في نادي برشلونة عبر التاريخ تقدر تذكر في 30 ثانية', ['17']),
    Question('كم لاعب لعب في نادي بايرن ميونخ عبر التاريخ تقدر تذكر في 30 ثانية',['4']),
    Question('كم لاعب لعب في نادي ارسنال عبر التاريخ تقدر تذكر في 30 ثانية',['كاسياس']),
    Question('كم لاعب لعب في نادي مانشستر يونايتد عبر التاريخ تقدر تذكر في 30 ثانية',['ميسي']),
      Question('كم لاعب لعب لنادي ريال مدريد عبر التاريخ تقدر تذكر في 30 ثانية', ['رونالدو']),
    Question('كم لاعب لعب في نادي برشلونة عبر التاريخ تقدر تذكر في 30 ثانية', ['17']),
    Question('كم لاعب لعب في نادي بايرن ميونخ عبر التاريخ تقدر تذكر في 30 ثانية',['4']),
    Question('كم لاعب لعب في نادي ارسنال عبر التاريخ تقدر تذكر في 30 ثانية',['كاسياس']),
    Question('كم لاعب لعب في نادي مانشستر يونايتد عبر التاريخ تقدر تذكر في 30 ثانية',['ميسي']),
    Question('كم لاعب لعب لنادي ريال مدريد عبر التاريخ تقدر تذكر في 30 ثانية', ['رونالدو']),
    Question('كم لاعب لعب في نادي برشلونة عبر التاريخ تقدر تذكر في 30 ثانية', ['17']),
    Question('كم لاعب لعب في نادي بايرن ميونخ عبر التاريخ تقدر تذكر في 30 ثانية',['4']),
    Question('كم لاعب لعب في نادي ارسنال عبر التاريخ تقدر تذكر في 30 ثانية',['كاسياس']),
    Question('كم لاعب لعب في نادي مانشستر يونايتد عبر التاريخ تقدر تذكر في 30 ثانية',['ميسي']),
    Question('كم لاعب لعب لنادي ريال مدريد عبر التاريخ تقدر تذكر في 30 ثانية', ['رونالدو']),
    Question('كم لاعب لعب في نادي برشلونة عبر التاريخ تقدر تذكر في 30 ثانية', ['17']),
    Question('كم لاعب لعب في نادي بايرن ميونخ عبر التاريخ تقدر تذكر في 30 ثانية',['4']),
    Question('كم لاعب لعب في نادي ارسنال عبر التاريخ تقدر تذكر في 30 ثانية',['كاسياس']),
    Question('كم لاعب لعب في نادي مانشستر يونايتد عبر التاريخ تقدر تذكر في 30 ثانية',['ميسي']),
  ];

  final List<List<VoidCallback>> buttonFunctions = [
    [
      () => print('Button R2C1 pressed'),
      () => print('Button R2C2 pressed'),
      () => print('Button R2C3 pressed'),
      () => print('Button R2C4 pressed'),
    ],
    [
      () => print('Button R3C1 pressed'),
      () => print('Button R3C2 pressed'),
      () => print('Button R3C3 pressed'),
      () => print('Button R3C4 pressed'),
    ],
    [
      () => print('Button R4C1 pressed'),
      () => print('Button R4C2 pressed'),
      () => print('Button R4C3 pressed'),
      () => print('Button R4C4 pressed'),
    ],
    [
      () => print('Button R5C1 pressed'),
      () => print('Button R5C2 pressed'),
      () => print('Button R5C3 pressed'),
      () => print('Button R5C4 pressed'),
    ],
  ];
  
  final List<Tables> questionTables = [Tables(['Header 1', 'Header 2', 'Header 3', 'Header 4'],['question1','question2','question3','question4','question5','question6','question7','question8','question9','question10','question11','question12','question13','question14','question15','question16'], ['question1','question2','question3','question4','question5','question6','question7','question8','question9','question10','question11','question12','question13','question14','question15','question16'],[['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde']],[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]),
  Tables(['Header 1', 'Header 2', 'Header 3', 'Header 4'],['question1','question2','question3','question4','question5','question6','question7','question8','question9','question10','question11','question12','question13','question14','question15','question16'], ['question1','question2','question3','question4','question5','question6','question7','question8','question9','question10','question11','question12','question13','question14','question15','question16'],[['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde']],[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]),
  Tables(['Header 1', 'Header 2', 'Header 3', 'Header 4'],['question1','question2','question3','question4','question5','question6','question7','question8','question9','question10','question11','question12','question13','question14','question15','question16'], ['question1','question2','question3','question4','question5','question6','question7','question8','question9','question10','question11','question12','question13','question14','question15','question16'],[['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde']],[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]),
  Tables(['Header 1', 'Header 2', 'Header 3', 'Header 4'],['question1','question2','question3','question4','question5','question6','question7','question8','question9','question10','question11','question12','question13','question14','question15','question16'], ['question1','question2','question3','question4','question5','question6','question7','question8','question9','question10','question11','question12','question13','question14','question15','question16'],[['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde'],['sss','sssd','ffgd','afde']],[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]),
  ];
}

class Question {
  String questionText;
  List<String> answers;
  Question(this.questionText, this.answers);
}

class Tables {
  List<String> namesRows;
  List<String> question;
  List<String> answersTable;
  List<List<String>> multipleChoices;
  List<bool> showChoices;
  Tables(this.namesRows,this.question,this.answersTable,this.multipleChoices,this.showChoices);
}