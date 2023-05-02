import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parcel_management/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'UserHomePage.dart';
import 'homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool validator1 = false;
  bool validator2 = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = new GlobalKey<FormState>();
  var logindata;
  var data;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1c1c1c),
      body:  isLoading ? Center(child: CircularProgressIndicator(color: Colors.white)) : Center(
        child:Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              SizedBox(height: 100,),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'PARCEL',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20,color: Colors.white),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: nameController,
                  style: TextStyle(color: Colors.white),
                  validator: (val) {
                    if (val!.isEmpty ||
                        RegExp(r"\s").hasMatch(val)) {
                      return "Email must not be empty";
                    } else {
                      if (RegExp(
                          r"^[a-zA-Z0-9]+[^#$%&*]+[a-zA-Z0-9]+@[a-z]+\.[a-z]{2,3}")
                          .hasMatch(val)) {
                        return null;
                      } else {
                        return "Enter a valid Email";
                      }
                    }
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'User Email',
                    labelStyle:TextStyle(color: Colors.white),
                    helperStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  validator: (val) {
                    if (val!.isEmpty ||
                        RegExp(r"\s").hasMatch(val)) {
                      return "Use Proper Password ";
                    }
                  },
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    labelStyle:TextStyle(color: Colors.white),
                    helperStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: const Text(
                  'Forgot Password ?',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                  height: 50,
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: const Text('Login',
                      style: TextStyle(color: Colors.black),),
                    onPressed: _submit
                  )),
              Row(
                children: <Widget>[
                  const Text('Does not have account?',
                    style: TextStyle(fontSize: 20,color: Colors.grey),),
                  TextButton(
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20,color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SignupPage()));
                      //signup screen
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      setState(() {
        isLoading = true;
      });
      final login_url = Uri.parse(
          "https://bluebirdgo.000webhostapp.com/API/LOGIN_ME.php");
      final response = await http
          .post(login_url, body: {
        "Email_Id": nameController.text,
        "Password": passwordController.text
      });
      if (response.statusCode == 200) {
        logindata = jsonDecode(response.body);
        data =
        jsonDecode(response.body)['user'];
        print(data);
        setState(() {
          isLoading = false;
        });
        if (logindata['error'] == false) {
          SharedPreferences setpreference = await SharedPreferences.getInstance();
          setpreference.setString('id', data['Login_Id'].toString());
          setpreference.setString('name', data['F_Name'].toString());
          setpreference.setString('last_name', data['L_Name'].toString());
          setpreference.setString('contactUs', data['Contact_No']!.toString());
          setpreference.setString('email', data['Email_Id'].toString());
          setpreference.setString('dob', data['DOB'].toString());

          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => UserHomePage()),
                  (route) => false);
        }else{
          Fluttertoast.showToast(
              msg: logindata['message'].toString(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2
          );
        }
      }
    }

  }

}
