// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:quis/login.dart';
import 'package:quis/pages.dart';
import 'package:quis/quis_page.dart';
import 'package:quis/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

int selectedIndex = 0;
var choos_language = 'English';
var choos_color = 'Defult';

class BottomNavBarExample extends StatefulWidget {
  const BottomNavBarExample({super.key});

  @override
  State<BottomNavBarExample> createState() => _BottomNavBarExampleState();
}

class _BottomNavBarExampleState extends State<BottomNavBarExample> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    setdata_choos();
    setdata_question();
    setdata_modelogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light_color,
      appBar: AppBar(
        foregroundColor: light_color,
        backgroundColor: dark_color,
        actions: [
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.download))
        ],
        title: Text(
          (selectedIndex == 0)
              ? 'Questions'
              : (selectedIndex == 1)
                  ? 'Add Question'
                  : 'Score',
          style: TextStyle(
            color: light_color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: light_color,
        elevation: 0,
        indicatorColor: dark_color,
        // indicatorShape: CircleBorder(),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        animationDuration: Duration(seconds: 1),
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        selectedIndex: selectedIndex,
        destinations: [
          NavigationDestination(
            tooltip: null,
            // selectedIcon: Icon(Icons.facebook),
            icon: Icon(
              Icons.question_answer,
              color: dark_color,
            ),
            label: 'Questions',

            selectedIcon: Icon(
              Icons.question_answer,
              color: light_color,
            ),
          ),
          NavigationDestination(
            icon: Icon(
              Icons.add,
              color: dark_color,
            ),
            label: 'Add Question',
            selectedIcon: Icon(
              Icons.add,
              color: light_color,
            ),
          ),
          // NavigationDestination(
          //   icon: Icon(Icons.person),
          //   label: 'Profile',
          //   selectedIcon: Icon(
          //     Icons.person,
          //     color: light_color,
          //   ),
          // ),
          NavigationDestination(
            icon: Icon(
              Icons.score,
              color: dark_color,
            ),
            label: 'Score',
            selectedIcon: Icon(
              Icons.score,
              color: light_color,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: light_color,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
              child: Container(
                width: double.maxFinite,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: dark_color,
                      width: 3,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: 100,
                      decoration: BoxDecoration(
                          color: dark_color,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          )),
                      child: Icon(
                        Icons.person,
                        color: light_color,
                        size: 100,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35, left: 15),
                      child: Text(
                        'User Name : ${username.text}',
                        style: TextStyle(
                          color: dark_color,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 15),
                      child: Text(
                        'Password    : ${password.text}',
                        style: TextStyle(
                          color: dark_color,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 15),
                      child: Text(
                        'My Score    : ${score}',
                        style: TextStyle(
                          color: dark_color,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
              child: Container(
                width: double.maxFinite,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: dark_color,
                      width: 3,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: 100,
                      decoration: BoxDecoration(
                          color: dark_color,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          )),
                      child: Icon(
                        Icons.settings,
                        color: light_color,
                        size: 75,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 15),
                      child: Row(
                        children: [
                          Text(
                            'Language    :',
                            style: TextStyle(
                              color: dark_color,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: DropdownButton(
                              elevation: 0,
                              dropdownColor: light_color,
                              iconEnabledColor: dark_color,
                              // focusColor: dark_color,
                              value: choos_language,
                              items: ['English']
                                  .map<DropdownMenuItem<String>>((String val) {
                                return DropdownMenuItem<String>(
                                  child: Text(
                                    val,
                                    style: TextStyle(
                                      color: dark_color,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  value: val,
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  choos_language = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 15),
                      child: Row(
                        children: [
                          Text(
                            'My Color     :',
                            style: TextStyle(
                              color: dark_color,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: DropdownButton(
                              elevation: 0,
                              dropdownColor: light_color,
                              iconEnabledColor: dark_color,
                              // focusColor: dark_color,
                              value: choos_color,
                              items: [
                                'Defult',
                                'Red',
                                'Blue',
                                'Green',
                                'Orange',
                                'Purple',
                                'Brown'
                              ].map<DropdownMenuItem<String>>((String val) {
                                return DropdownMenuItem<String>(
                                  child: Text(
                                    val,
                                    style: TextStyle(
                                      color: dark_color,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  value: val,
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  choos_color = value!;
                                  color_value(value);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
              child: InkWell(
                onTap: () {
                  mode = '0';
                  setdata_modelogin();
                  delete_storage();
                  Navigator.pop(context);
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
                    'Log Out',
                    style: TextStyle(
                      color: light_color,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // setdata_choos() async {
  //   SharedPreferences prefer = await SharedPreferences.getInstance();

  //   prefer.setString('chooscolor', choos_color);
  //   prefer.setString('chooslanguage', choos_language);

  //   print('set choos');
  // }

  // setdata_question() async {
  //   SharedPreferences prefer = await SharedPreferences.getInstance();

  //   prefer.setString('score', score.toString());
  //   prefer.setString('index_question', index_question.toString());
  //   prefer.setString('count', count.toString());
  //   // prefer.setString('questions', questions.toString());
  //   print('set question');
  // }

  delete_storage() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.remove('score');
    prefer.remove('count');
    prefer.remove('index_question');
    prefer.remove('chooscolor');
    prefer.remove('chooslanguage');
    prefer.remove('username');
    prefer.remove('password');
    // prefer.remove('mode');
  }
}

setdata_choos() async {
  SharedPreferences prefer = await SharedPreferences.getInstance();

  prefer.setString('chooscolor', choos_color);
  prefer.setString('chooslanguage', choos_language);

  print('set choos');
}

setdata_question() async {
  SharedPreferences prefer = await SharedPreferences.getInstance();

  prefer.setString('score', score.toString());
  prefer.setString('index_question', index_question.toString());
  prefer.setString('count', count.toString());
  // prefer.setString('questions', questions.toString());
  print('set question');
}

String mode = '0';

setdata_modelogin() async {
  SharedPreferences prefer = await SharedPreferences.getInstance();
  prefer.setString('mode', mode);
  print('set mode');
}
