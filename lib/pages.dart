// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:quis/login.dart';
import 'package:quis/main.dart';
import 'package:quis/bottomnavbar.dart';
import 'package:quis/quis_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController newquestion = TextEditingController();
TextEditingController answer1 = TextEditingController();
TextEditingController answer2 = TextEditingController();
TextEditingController answer3 = TextEditingController();
TextEditingController answer4 = TextEditingController();

int selected = 0;

int index_question = 0;

List<Widget> pages = [
  Scaffold(
    backgroundColor: light_color,
    body: StatefulBuilder(
      builder: (context, setState) => ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(
              'Question ${index + 1}',
              style: TextStyle(
                  color: (count < index) ? light_color : dark_color,
                  fontWeight: FontWeight.bold),
            ),
            trailing: Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                  color: (count <= index) ? light_color : dark_color,
                  borderRadius: BorderRadius.circular(20)),
            ),
            onTap: () {
              if (count == index) {
                index_question = index;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuisPage()),
                );
              } else {}
            },
            leading: (count <= index)
                ? Icon(
                    Icons.shower,
                    color: light_color,
                  )
                : InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              'Correct',
                              style: TextStyle(
                                color: dark_color,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: double.maxFinite,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: light_color,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${questions[index].question}',
                                      style: TextStyle(
                                        color: dark_color,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: Divider(
                                    color: dark_color,
                                  ),
                                ),
                                Container(
                                  width: double.maxFinite,
                                  height: 350,
                                  child: ListView.builder(
                                    itemCount: questions[index].answers.length,
                                    itemBuilder: (context, ind) => Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: Container(
                                        width: double.maxFinite,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: (questions[index]
                                                      .answers[ind]
                                                      .isCorrect ==
                                                  true)
                                              ? dark_color
                                              : light_color,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                            child: Text(
                                          '${questions[index].answers[ind].answer}',
                                          style: TextStyle(
                                            color: (questions[index]
                                                        .answers[ind]
                                                        .isCorrect ==
                                                    false)
                                                ? dark_color
                                                : light_color,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Cancle',
                                  style: TextStyle(
                                    color: dark_color,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.shower,
                      color: dark_color,
                    ),
                  ),
          ),
        ),
      ),
    ),
  ),
  Scaffold(
    body: StatefulBuilder(
      builder: (context, setState) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 25, left: 30, right: 30, bottom: 15),
              child: TextField(
                controller: newquestion,
                cursorColor: dark_color,
                style: TextStyle(
                  color: dark_color,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: 'Add Question',
                  hintStyle: TextStyle(
                    color: dark_color,
                  ),
                  hoverColor: dark_color,
                  focusColor: dark_color,
                  fillColor: dark_color,
                  labelText: 'Add Question',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: dark_color,
                      width: 2,
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: dark_color,
                    decorationColor: dark_color,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: dark_color,
                      width: 2,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: dark_color,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Divider(
                color: dark_color,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RadioListTile(
                activeColor: dark_color,
                value: 0,
                groupValue: selected,
                title: TextField(
                  controller: answer1,
                  cursorColor: dark_color,
                  style: TextStyle(
                    color: dark_color,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Add Answer',
                    hintStyle: TextStyle(
                      color: dark_color,
                    ),
                    hoverColor: dark_color,
                    focusColor: dark_color,
                    fillColor: dark_color,
                    labelText: 'Add Answer',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: dark_color,
                        width: 2,
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: dark_color,
                      decorationColor: dark_color,
                      fontWeight: FontWeight.bold,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: dark_color,
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: dark_color,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    selected = 0;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RadioListTile(
                activeColor: dark_color,
                value: 1,
                groupValue: selected,
                title: TextField(
                  controller: answer2,
                  cursorColor: dark_color,
                  style: TextStyle(
                    color: dark_color,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Add Answer',
                    hintStyle: TextStyle(
                      color: dark_color,
                    ),
                    hoverColor: dark_color,
                    focusColor: dark_color,
                    fillColor: dark_color,
                    labelText: 'Add Answer',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: dark_color,
                        width: 2,
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: dark_color,
                      decorationColor: dark_color,
                      fontWeight: FontWeight.bold,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: dark_color,
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: dark_color,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    selected = 1;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RadioListTile(
                activeColor: dark_color,
                value: 2,
                groupValue: selected,
                title: TextField(
                  controller: answer3,
                  cursorColor: dark_color,
                  style: TextStyle(
                    color: dark_color,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Add Answer',
                    hintStyle: TextStyle(
                      color: dark_color,
                    ),
                    hoverColor: dark_color,
                    focusColor: dark_color,
                    fillColor: dark_color,
                    labelText: 'Add Answer',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: dark_color,
                        width: 2,
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: dark_color,
                      decorationColor: dark_color,
                      fontWeight: FontWeight.bold,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: dark_color,
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: dark_color,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    selected = 2;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RadioListTile(
                activeColor: dark_color,
                value: 3,
                groupValue: selected,
                title: TextField(
                  controller: answer4,
                  cursorColor: dark_color,
                  style: TextStyle(
                    color: dark_color,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Add Answer',
                    hintStyle: TextStyle(
                      color: dark_color,
                    ),
                    hoverColor: dark_color,
                    focusColor: dark_color,
                    fillColor: dark_color,
                    labelText: 'Add Answer',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: dark_color,
                        width: 2,
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: dark_color,
                      decorationColor: dark_color,
                      fontWeight: FontWeight.bold,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: dark_color,
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: dark_color,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    selected = 3;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: InkWell(
                onTap: () {
                  if (newquestion.text.isNotEmpty &&
                      answer1.text.isNotEmpty &&
                      answer2.text.isNotEmpty &&
                      answer3.text.isNotEmpty &&
                      answer4.text.isNotEmpty) {
                    questions.add(
                      QuestionModel(
                        question: '${newquestion.text}',
                        time: 20,
                        answers: [
                          AnswerModel(
                              answer: answer1.text, isCorrect: true1(selected)),
                          AnswerModel(
                              answer: answer2.text, isCorrect: true2(selected)),
                          AnswerModel(
                              answer: answer3.text, isCorrect: true3(selected)),
                          AnswerModel(
                              answer: answer4.text, isCorrect: true4(selected)),
                        ],
                      ),
                    );
                  }
                  newquestion.text = '';
                  answer1.text = '';
                  answer2.text = '';
                  answer3.text = '';
                  answer4.text = '';
                  selected = 0;
                },
                child: Container(
                  width: double.maxFinite,
                  height: 50,
                  decoration: BoxDecoration(
                    color: dark_color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Add',
                      style: TextStyle(
                        color: light_color,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  ),
  Scaffold(
    body: StatefulBuilder(
        builder: (context, setState) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: light_color,
                        border: Border.all(
                          color: dark_color,
                          width: 3,
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'My Score',
                          style: TextStyle(
                            color: dark_color,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          '${score}',
                          style: TextStyle(
                            color: dark_color,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Container(
                      width: double.maxFinite,
                      height: 200,
                      decoration: BoxDecoration(
                          color: light_color,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: dark_color, width: 3)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 7,
                                      height: 7,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: dark_color,
                                      ),
                                    ),
                                    Text(
                                      ' ${(score * 100 / questions.length).toInt()}%',
                                      style: TextStyle(
                                        color: dark_color,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                ' Completion',
                                style: TextStyle(
                                  color: dark_color,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 55),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 7,
                                      height: 7,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green,
                                      ),
                                    ),
                                    Text(
                                      ' ${score}',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                ' Correct',
                                style: TextStyle(
                                  color: dark_color,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 25),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 7,
                                          height: 7,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: dark_color,
                                          ),
                                        ),
                                        Text(
                                          ' ${questions.length}',
                                          style: TextStyle(
                                            color: dark_color,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    ' Total Questions',
                                    style: TextStyle(
                                      color: dark_color,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 55),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 7,
                                          height: 7,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.red,
                                          ),
                                        ),
                                        Text(
                                          ' ${questions.length - score}',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    ' Wrong',
                                    style: TextStyle(
                                      color: dark_color,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ],
            )),
  ),
];
