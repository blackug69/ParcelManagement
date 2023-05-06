import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parcel_management/homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:parcel_management/login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController contactNoController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var logindata;
  var data;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF1c1c1c),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF1c1c1c),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.white,
            )),
      ),
      body: SafeArea(
        child: isLoading ? Center(child: CircularProgressIndicator(color: Colors.white)) : SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Create an Account,Its free",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                controller: firstNameController,
                                style: TextStyle(color: Colors.white),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please enter first name";
                                  }
                                },
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'First Name',
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
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                controller: lastNameController,
                                style: TextStyle(color: Colors.white),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please enter last name";
                                  }
                                },
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Last Name',
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
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                controller: emailController,
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
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                controller: contactNoController,
                                style: TextStyle(color: Colors.white),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please enter contact no";
                                  }
                                },
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Contact no',
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
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                controller: dobController,
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickeddate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1993),
                                      lastDate:DateTime.now() );

                                  if (pickeddate != null) {
                                    setState(() {
                                      dobController.text = DateFormat('yyyy-MM-dd').format(pickeddate);
                                    });
                                  }
                                },
                                style: TextStyle(color: Colors.white),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please select dob";
                                  }
                                },
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'DOB',
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
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          padding: EdgeInsets.only(top: 3, left: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  top: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black))),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 60,
                            onPressed:_submit,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: TextButton(
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF1c1c1c),
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? ",style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                                  builder: (BuildContext context) => LoginPage()), (
                                  Route<dynamic> route) => false);
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18,color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      setState(() {
        isLoading = true;
      });
      final login_url = Uri.parse(
          "https://bluebirdgo.000webhostapp.com/API/signup.php");
      final response = await http
          .post(login_url, body: {
        "Email_Id": emailController.text,
        "Password": passwordController.text,
        "F_Name": firstNameController.text,
        "L_Name": lastNameController.text,
        "Contact_no": contactNoController.text,
        "DOB": dobController.text,

      });
      if (response.statusCode == 200) {
        logindata = jsonDecode(response.body);
        data =
        jsonDecode(response.body)['user'];
        print(logindata);
        setState(() {
          isLoading = false;
        });
        if (logindata['error'] == false) {
          Fluttertoast.showToast(
              msg: logindata['message'].toString(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2
          );
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => LoginPage()),
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
