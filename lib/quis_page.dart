import 'dart:async';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:quis/main.dart';
import 'package:quis/pages.dart';
import 'package:quis/bottomnavbar.dart';
import 'package:quis/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

int score = 0;
int count = 0;

class QuisPage extends StatefulWidget {
  const QuisPage({super.key});

  @override
  State<QuisPage> createState() => _QuisPageState();
}

class _QuisPageState extends State<QuisPage> {
  Color color_container = light_color;

  int _timequis = questions[index_question].time.toInt();
  late Timer _timer;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // setdata_question();
    // dispose();

    // _timequis;
    // context;
    // mounted;
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   _timer = Timer.periodic(Duration(seconds: 1), (timer) {
  //     setState(() {
  //       _timequis--;
  //     });
  //   });
  //   // setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark_color,
        title: Text(
          'Question ${index_question + 1}',
          style: TextStyle(color: light_color, fontWeight: FontWeight.bold),
        ),
        leading: Text(''),
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.maxFinite,
                height: 150,
                decoration: BoxDecoration(
                  color: dark_color,
                  // border: Border.all(color: dark_color),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  width: double.maxFinite,
                  height: 325,
                  child: ListView.builder(
                    itemCount: questions[index_question].answers.length,
                    itemBuilder: (context, index) => Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 30, right: 30),
                      child: Card(
                        elevation: 3,
                        shadowColor: dark_color,
                        color: light_color,
                        child: ListTile(
                          onTap: () {
                            if (questions[index_question]
                                    .answers[index]
                                    .isCorrect ==
                                true) {
                              setState(() {
                                color_container = Colors.green;
                                count++;
                                score++;
                                Navigator.pop(context);
                              });
                            } else {
                              setState(() {
                                color_container = Colors.red;
                                count++;
                                Navigator.pop(context);
                              });
                            }
                          },
                          title: Center(
                            child: Text(
                              '${questions[index_question].answers[index].answer}',
                              style: TextStyle(
                                  color: dark_color,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 330, left: 30, right: 30),
            child: Center(
              child: Positioned(
                child: Container(
                  width: double.maxFinite,
                  height: 125,
                  decoration: BoxDecoration(
                    color: light_color,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: dark_color, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(
                        child: Text(
                      '${questions[index_question].question}',
                      style: TextStyle(
                          color: dark_color,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 450),
            child: Center(
              child: Positioned(
                  child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: light_color,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: dark_color, width: 2)),
                child: Center(
                    child: Text(
                  '${_timequis}',
                  style:
                      TextStyle(color: dark_color, fontWeight: FontWeight.bold),
                )),
              )),
            ),
          )
        ],
      ),
    );
  }

  // setdata_question() async {
  //   SharedPreferences prefer = await SharedPreferences.getInstance();

  //   prefer.setInt('score', score);
  //   prefer.setInt('index_question', index_question);
  //   prefer.setInt('count', count);
  //   print('set question');
  //   // prefer.setString('questions', questions.toString());
  // }
}

int country = 0;
int country2 = 0;

class StartApp extends StatefulWidget {
  const StartApp({super.key});

  @override
  State<StartApp> createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // if (username.text.isEmpty) {
    //   setdata_choos();
    //   setdata_login();
    //   setdata_question();
    // }
    // getdata_username().then((value) {
    //   print('name' + value!);
    //   setState(() {
    //     if (value != null) {
    //       username.text = value.toString();
    //     } else {
    //       username.text = '';
    //     }
    //   });
    // });
    // username.text = '';
    // getdata_modelogin().then((value) {
    //   print('mode ' + value);
    //   setState(() {
    //     mode = value;
    //   });
    // });
    // getdata_modelogin().then((value) {
    //   print('mode ' + value!);
    //   setState(() {
    //     mode = value!;
    //   });
    // });
    getdata_modelogin().then((value) {
      setState(() {
        mode = value;
      });
    });
    // if (mode == '1') {
    // getdata_username().then((value) {
    //   print('name' + value!);
    //   setState(() {
    //     if (value != null) {
    //       username.text = value.toString();
    //     }
    //   });
    // });
    // getdata_password().then((value) {
    //   print('password' + value!);
    //   setState(() {
    //     if (value != null) {
    //       password.text = value.toString();
    //     }
    //   });
    // });
    // getdata_score().then((value) {
    //   print('score' + value!);
    //   setState(() {
    //     if (value != null) {
    //       score = int.parse(value);
    //     }
    //   });
    // });
    // getdata_count().then((value) {
    //   print('count' + value!);
    //   setState(() {
    //     if (value != null) {
    //       count = int.parse(value);
    //     }
    //   });
    // });
    // getdata_chooscolor().then((value) {
    //   print('color' + value!);
    //   setState(() {
    //     if (value != null) {
    //       choos_color = value.toString();
    //       color_value(value);
    //     }
    //   });
    // });
    // getdata_chooslanguage().then((value) {
    //   print('language' + value!);
    //   setState(() {
    //     if (value != null) {
    //       choos_language = value.toString();
    //     }
    //   });
    // });
    // getdata_index_question().then((value) {
    //   print('index_question' + value!);
    //   setState(() {
    //     if (value != null) {
    //       index_question = int.parse(value);
    //     }
    //   });
    // });
    // print('i am off');
    // } else if (mode == '0') {
    // username.text = '';
    // password.text = '';
    // score = 0;
    // count = 0;
    // index_question = 0;
    // choos_color = 'Defult';
    // choos_language = 'English';
    // print('i am defult');
    // }
    Timer.periodic(Duration(seconds: 0), (timer) {
      if (country2 == 0) {
        print('ok');
        if (mode == '1') {
          getdata_username().then((value) {
            print('name' + value!);
            setState(() {
              if (value != null) {
                username.text = value.toString();
              }
            });
          });
          getdata_password().then((value) {
            print('password' + value!);
            setState(() {
              if (value != null) {
                password.text = value.toString();
              }
            });
          });
          getdata_score().then((value) {
            print('score' + value!);
            setState(() {
              if (value != null) {
                score = int.parse(value);
              }
            });
          });
          getdata_count().then((value) {
            print('count' + value!);
            setState(() {
              if (value != null) {
                count = int.parse(value);
              }
            });
          });
          getdata_chooscolor().then((value) {
            print('color' + value!);
            setState(() {
              if (value != null) {
                choos_color = value.toString();
                color_value(value);
              }
            });
          });
          getdata_chooslanguage().then((value) {
            print('language' + value!);
            setState(() {
              if (value != null) {
                choos_language = value.toString();
              }
            });
          });
          getdata_index_question().then((value) {
            print('index_question' + value!);
            setState(() {
              if (value != null) {
                index_question = int.parse(value);
              }
            });
          });
          print('i am off');
        } else if (mode == '0') {
          username.text = '';
          password.text = '';
          score = 0;
          count = 0;
          index_question = 0;
          choos_color = 'Defult';
          choos_language = 'English';
          print('i am defult');
        }

        country2++;
      }
    });
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (country == 0) {
        print('ok');
        if (mode == '1') {
          getdata_username().then((value) {
            print('name' + value!);
            setState(() {
              if (value != null) {
                username.text = value.toString();
              }
            });
          });
          getdata_password().then((value) {
            print('password' + value!);
            setState(() {
              if (value != null) {
                password.text = value.toString();
              }
            });
          });
          getdata_score().then((value) {
            print('score' + value!);
            setState(() {
              if (value != null) {
                score = int.parse(value);
              }
            });
          });
          getdata_count().then((value) {
            print('count' + value!);
            setState(() {
              if (value != null) {
                count = int.parse(value);
              }
            });
          });
          getdata_chooscolor().then((value) {
            print('color' + value!);
            setState(() {
              if (value != null) {
                choos_color = value.toString();
                color_value(value);
              }
            });
          });
          getdata_chooslanguage().then((value) {
            print('language' + value!);
            setState(() {
              if (value != null) {
                choos_language = value.toString();
              }
            });
          });
          getdata_index_question().then((value) {
            print('index_question' + value!);
            setState(() {
              if (value != null) {
                index_question = int.parse(value);
              }
            });
          });
          print('i am off');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNavBarExample(),
            ),
          );
        } else if (mode == '0') {
          username.text = '';
          password.text = '';
          score = 0;
          count = 0;
          index_question = 0;
          choos_color = 'Defult';
          choos_language = 'English';
          print('i am defult');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        }

        country++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light_color,
      body: Center(
        child: Text(
          'Questions',
          style: TextStyle(
              color: dark_color, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
    );
  }
}
