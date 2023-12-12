import 'package:flutter/material.dart';
import 'package:quis/login.dart';
import 'package:quis/quis_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:quis/pages.dart';
import 'package:quis/bottomnavbar.dart';

color_value(String value) {
  if (value == 'Red') {
    dark_color = Color(0xFFFF0000);
    light_color = Color(0xFFFA8072);
  } else if (value == 'Blue') {
    dark_color = Color(0xFF0000FF);
    light_color = Color(0xFF87CEFA);
  } else if (value == 'Green') {
    dark_color = Color(0xFF008000);
    light_color = Color(0xFF98FB98);
  } else if (value == 'Orange') {
    dark_color = Color(0xFFFFA500);
    light_color = Color.fromARGB(255, 252, 234, 137);
  } else if (value == 'Defult') {
    dark_color = Color(0xFF74239e);
    light_color = Color(0xFFe2cced);
  } else if (value == 'Purple') {
    dark_color = Color(0xFF800080);
    light_color = Color(0xFFDDA0DD);
  } else if (value == 'Brown') {
    dark_color = Color(0xFFA0522D);
    light_color = Color(0xFFDEB887);
  }
}

Future getdata_score() async {
  SharedPreferences prefer = await SharedPreferences.getInstance();
  var getscore = prefer.getString('score');
  return getscore;
}

Future getdata_count() async {
  SharedPreferences prefer = await SharedPreferences.getInstance();
  var getcount = prefer.getString('count');
  return getcount;
}

Future getdata_username() async {
  SharedPreferences prefer = await SharedPreferences.getInstance();
  var getusername = prefer.getString('username');
  return getusername;
}

Future getdata_password() async {
  SharedPreferences prefer = await SharedPreferences.getInstance();
  var getpassword = prefer.getString('password');
  return getpassword;
}

// Future getdata_questions() async {
//   SharedPreferences prefer = await SharedPreferences.getInstance();
//   var getquestions = prefer.getString('questions');
//   return getquestions;
// }

Future getdata_index_question() async {
  SharedPreferences prefer = await SharedPreferences.getInstance();
  var getindex_question = prefer.getString('index_question');
  return getindex_question;
}

Future getdata_chooscolor() async {
  SharedPreferences prefer = await SharedPreferences.getInstance();
  var getchoos_color = prefer.getString('chooscolor');
  return getchoos_color;
}

Future getdata_chooslanguage() async {
  SharedPreferences prefer = await SharedPreferences.getInstance();
  var getchoos_language = prefer.getString('chooslanguage');
  return getchoos_language;
}

Future getdata_modelogin() async {
  SharedPreferences prefer = await SharedPreferences.getInstance();
  var get_modelogen = prefer.getString('mode');
  return get_modelogen;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartApp(),
    );
  }
}

Color dark_color = Color(0xFF74239e);
Color light_color = Color(0xFFe2cced);

class QuestionModel {
  String question;
  num time;
  List<AnswerModel> answers;
  QuestionModel(
      {required this.question, required this.time, required this.answers});
}

class AnswerModel {
  String answer;
  bool isCorrect;
  AnswerModel({required this.answer, required this.isCorrect});
}

List<QuestionModel> questions = [
  QuestionModel(question: '20 * 3 =', time: 20, answers: [
    AnswerModel(answer: '20', isCorrect: false),
    AnswerModel(answer: '3', isCorrect: false),
    AnswerModel(answer: '60', isCorrect: true),
    AnswerModel(answer: '203', isCorrect: false),
  ]),
  QuestionModel(question: '41 + 9 =', time: 20, answers: [
    AnswerModel(answer: '50', isCorrect: true),
    AnswerModel(answer: '32', isCorrect: false),
    AnswerModel(answer: '41', isCorrect: false),
    AnswerModel(answer: '9', isCorrect: false),
  ]),
  QuestionModel(question: '120 / 3 =', time: 20, answers: [
    AnswerModel(answer: '30', isCorrect: false),
    AnswerModel(answer: '40', isCorrect: true),
    AnswerModel(answer: '60', isCorrect: false),
    AnswerModel(answer: '120', isCorrect: false),
  ]),
  QuestionModel(question: '10 * 0 =', time: 20, answers: [
    AnswerModel(answer: '10', isCorrect: false),
    AnswerModel(answer: '0', isCorrect: true),
    AnswerModel(answer: '1', isCorrect: false),
    AnswerModel(answer: '100', isCorrect: false),
  ]),
  QuestionModel(question: '(5 * 2) + 2 =', time: 20, answers: [
    AnswerModel(answer: '12', isCorrect: true),
    AnswerModel(answer: '9', isCorrect: false),
    AnswerModel(answer: '8', isCorrect: false),
    AnswerModel(answer: '522', isCorrect: false),
  ]),
  QuestionModel(question: '70 + 5 =', time: 20, answers: [
    AnswerModel(answer: '75', isCorrect: true),
    AnswerModel(answer: '57', isCorrect: false),
    AnswerModel(answer: '65', isCorrect: false),
    AnswerModel(answer: '705', isCorrect: false),
  ]),
  QuestionModel(question: '22 - 2 =', time: 20, answers: [
    AnswerModel(answer: '24', isCorrect: false),
    AnswerModel(answer: '22', isCorrect: false),
    AnswerModel(answer: '2', isCorrect: false),
    AnswerModel(answer: '20', isCorrect: true),
  ]),
  QuestionModel(question: '-100 +105 =', time: 20, answers: [
    AnswerModel(answer: '-5', isCorrect: false),
    AnswerModel(answer: '205', isCorrect: false),
    AnswerModel(answer: '105', isCorrect: false),
    AnswerModel(answer: '5', isCorrect: true),
  ]),
  QuestionModel(question: '5 + (2 * 0) =', time: 20, answers: [
    AnswerModel(answer: '0', isCorrect: false),
    AnswerModel(answer: '5', isCorrect: true),
    AnswerModel(answer: '6', isCorrect: false),
    AnswerModel(answer: '7', isCorrect: false),
  ]),
  QuestionModel(question: '50 + 10 =', time: 20, answers: [
    AnswerModel(answer: '40', isCorrect: false),
    AnswerModel(answer: '30', isCorrect: false),
    AnswerModel(answer: '60', isCorrect: true),
    AnswerModel(answer: '510', isCorrect: false),
  ]),
  QuestionModel(question: '80 - 40 =', time: 20, answers: [
    AnswerModel(answer: '40', isCorrect: true),
    AnswerModel(answer: '120', isCorrect: false),
    AnswerModel(answer: '840', isCorrect: false),
    AnswerModel(answer: '0', isCorrect: false),
  ]),
  QuestionModel(question: '1000 * 1 =', time: 20, answers: [
    AnswerModel(answer: '1001', isCorrect: false),
    AnswerModel(answer: '1000', isCorrect: true),
    AnswerModel(answer: '999', isCorrect: false),
    AnswerModel(answer: '1', isCorrect: false),
  ]),
  QuestionModel(question: '502 - 2 + 5 =', time: 20, answers: [
    AnswerModel(answer: '505', isCorrect: true),
    AnswerModel(answer: '507', isCorrect: false),
    AnswerModel(answer: '500', isCorrect: false),
    AnswerModel(answer: '495', isCorrect: false),
  ]),
  QuestionModel(question: '320 + 30 =', time: 20, answers: [
    AnswerModel(answer: '300', isCorrect: false),
    AnswerModel(answer: '290', isCorrect: false),
    AnswerModel(answer: '330', isCorrect: false),
    AnswerModel(answer: '350', isCorrect: true),
  ]),
  QuestionModel(question: '404 / 4 =', time: 20, answers: [
    AnswerModel(answer: '400', isCorrect: false),
    AnswerModel(answer: '100', isCorrect: false),
    AnswerModel(answer: '4', isCorrect: false),
    AnswerModel(answer: '101', isCorrect: true),
  ]),
  QuestionModel(question: '22 * 5 =', time: 20, answers: [
    AnswerModel(answer: '100', isCorrect: false),
    AnswerModel(answer: '27', isCorrect: false),
    AnswerModel(answer: '17', isCorrect: false),
    AnswerModel(answer: '110', isCorrect: true),
  ]),
  QuestionModel(question: '5 + 5 * 5 =', time: 20, answers: [
    AnswerModel(answer: '50', isCorrect: false),
    AnswerModel(answer: '25', isCorrect: false),
    AnswerModel(answer: '5', isCorrect: false),
    AnswerModel(answer: '30', isCorrect: true),
  ]),
  QuestionModel(question: '5 - 5 * 5 =', time: 20, answers: [
    AnswerModel(answer: '-20', isCorrect: true),
    AnswerModel(answer: '20', isCorrect: false),
    AnswerModel(answer: '30', isCorrect: false),
    AnswerModel(answer: '25', isCorrect: false),
  ]),
  QuestionModel(question: '5 * 5 / 5 =', time: 20, answers: [
    AnswerModel(answer: '5', isCorrect: true),
    AnswerModel(answer: '50', isCorrect: false),
    AnswerModel(answer: '25', isCorrect: false),
    AnswerModel(answer: '555', isCorrect: false),
  ]),
  QuestionModel(question: '5 + 5 / 5 =', time: 20, answers: [
    AnswerModel(answer: '50', isCorrect: false),
    AnswerModel(answer: '5', isCorrect: false),
    AnswerModel(answer: '1', isCorrect: false),
    AnswerModel(answer: '6', isCorrect: true),
  ]),
];

true1(int select) {
  if (select == 0) {
    return true;
  } else {
    return false;
  }
}

true2(int select) {
  if (select == 1) {
    return true;
  } else {
    return false;
  }
}

true3(int select) {
  if (select == 2) {
    return true;
  } else {
    return false;
  }
}

true4(int select) {
  if (select == 3) {
    return true;
  } else {
    return false;
  }
}
