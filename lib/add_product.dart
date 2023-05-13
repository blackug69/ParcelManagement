import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parcel_management/UserHomePage.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'homepage.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController rfidKeyController = TextEditingController();
  final formKey = new GlobalKey<FormState>();
  var logindata;
  var data;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xFF1c1c1c),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          color:Colors.white,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title:Row(
          children: [
            Text("Add Product",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
          ],
        ),
      ),
      body: isLoading ? Center(child: CircularProgressIndicator(color:Color(0xFF1c1c1c))) : SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: TextFormField(
                  style: TextStyle(color: Color(0xFF1c1c1c)),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter name";
                    }
                  },
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    labelStyle:TextStyle(color: Color(0xFF1c1c1c)),
                    helperStyle: TextStyle(color: Color(0xFF1c1c1c)),
                    hintStyle: TextStyle(color: Color(0xFF1c1c1c)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        color: Color(0xFF1c1c1c),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        color: Color(0xFF1c1c1c),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: TextFormField(
                  style: TextStyle(color: Color(0xFF1c1c1c)),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter description";
                    }
                  },
                  controller: descriptionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                    labelStyle:TextStyle(color: Color(0xFF1c1c1c)),
                    helperStyle: TextStyle(color: Color(0xFF1c1c1c)),
                    hintStyle: TextStyle(color: Color(0xFF1c1c1c)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        color: Color(0xFF1c1c1c),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        color: Color(0xFF1c1c1c),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: TextFormField(
                  style: TextStyle(color: Color(0xFF1c1c1c)),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter price";
                    }
                  },
                  controller: priceController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Price',
                    labelStyle:TextStyle(color: Color(0xFF1c1c1c)),
                    helperStyle: TextStyle(color: Color(0xFF1c1c1c)),
                    hintStyle: TextStyle(color: Color(0xFF1c1c1c)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        color: Color(0xFF08364B),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        color: Color(0xFF1c1c1c),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: TextFormField(
                  style: TextStyle(color: Color(0xFF1c1c1c)),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter rfid key";
                    }
                  },
                  controller: rfidKeyController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'RFID Key',
                    labelStyle:TextStyle(color: Color(0xFF1c1c1c)),
                    helperStyle: TextStyle(color: Color(0xFF1c1c1c)),
                    hintStyle: TextStyle(color: Color(0xFF1c1c1c)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        color: Color(0xFF1c1c1c),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        color: Color(0xFF1c1c1c),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height:30 ,),
              Container(
                  height: 55,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 16,right: 16),
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xFF1c1c1c)),
                      ),
                      child: const Text('Add Product',
                        style: TextStyle(color: Colors.white),),
                      onPressed: _submit
                  )),
            ],
          ),
        ),
      ) ,
    );
  }

  Future<void> _submit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final form = formKey.currentState;
    if (form!.validate()) {
      setState(() {
        isLoading = true;
      });
      final login_url = Uri.parse(
          "https://bluebirdgo.000webhostapp.com/API/addproduct.php");
      final response = await http
          .post(login_url, body: {
        "name": nameController.text,
        "description": descriptionController.text,
        "price": priceController.text,
        "rfid_key": rfidKeyController.text,
      });
      if (response.statusCode == 200) {
        logindata = jsonDecode(response.body);
        print(data);
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
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => UserHomePage()), (Route<dynamic> route) => false);
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
