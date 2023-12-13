import 'package:flutter/material.dart';
import 'package:quis/bottomnavbar.dart';
import 'package:quis/main.dart';
import 'package:quis/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quis/quis_page.dart';
import 'package:async/async.dart';
import 'dart:async';

TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernamekey = GlobalKey<FormState>();
  final _passwordkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light_color,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: username,
                      key: _usernamekey,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'plase enter your name';
                        }
                      },
                      cursorColor: dark_color,
                      style: TextStyle(
                        color: dark_color,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: 'user name',
                        hintStyle: TextStyle(
                          color: dark_color,
                        ),
                        hoverColor: dark_color,
                        focusColor: dark_color,
                        fillColor: dark_color,
                        labelText: 'user name',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: dark_color,
                            width: 2,
                          ),
                        ),
                        prefixIcon: Icon(Icons.person),
                        prefixIconColor: dark_color,
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
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: password,
                      obscureText: true,
                      key: _passwordkey,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'plase enter your password';
                        }
                      },
                      cursorColor: dark_color,
                      style: TextStyle(
                        color: dark_color,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: 'password',
                        hintStyle: TextStyle(
                          color: dark_color,
                        ),
                        hoverColor: dark_color,
                        focusColor: dark_color,
                        fillColor: dark_color,
                        labelText: 'password',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: dark_color,
                            width: 2,
                          ),
                        ),
                        prefixIcon: Icon(Icons.lock),
                        prefixIconColor: dark_color,
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
                ],
              ),
            ),
            InkWell(
              onTap: () {
                // if (_usernamekey.currentState!.validate() &&
                //     _passwordkey.currentState!.validate()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavBarExample(),
                  ),
                );
                setdata_login();
                mode = '1';
                // setdata_modelogin();
                // }
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.maxFinite,
                  height: 50,
                  decoration: BoxDecoration(
                    color: dark_color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xFFe9cced),
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
    );
  }

  // setdata_login() async {
  //   SharedPreferences prefer = await SharedPreferences.getInstance();

  //   prefer.setString('username', username.text);
  //   prefer.setString('password', password.text);
  //   print('set logen');
  // }
}

setdata_login() async {
  SharedPreferences prefer = await SharedPreferences.getInstance();

  prefer.setString('username', username.text);
  prefer.setString('password', password.text);
  print('set logen');
}
