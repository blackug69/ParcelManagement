import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parcel_management/product_page.dart';
import 'package:parcel_management/temperature_page.dart';
import 'package:parcel_management/trackorder.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'UserMainDrawer.dart';
import 'nearby_office.dart';

class UserHomePage extends StatefulWidget {
  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage>with TickerProviderStateMixin {
  bool _isLoading = false;
  DateTime? backbuttonpressedTime;
  bool isView= false;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();
    //Statement 1 Or statement2
    bool backButton = backbuttonpressedTime == null ||
        currentTime.difference(backbuttonpressedTime!) > Duration(seconds: 3);
    if (backButton) {
      backbuttonpressedTime = currentTime;
      Fluttertoast.showToast(
        msg: "Please click BACK again to exit",
      );
      return false;
    }
    return true;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor:Color(0xFF1c1c1c),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        title:Text('Dashboard',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
        actions: <Widget>[
          // IconButton(icon: Icon(Icons.notifications),color:Color(0xFFeec05a),iconSize: 30,
          //   onPressed:(){},
          // ),
          SizedBox(width: 10,),
        ],
      ),
      drawer:  UserMainDrawer(),
      body: _isLoading ? Center(child: CircularProgressIndicator()) : ListView(
        children: [
          SizedBox(height: 30,),
          Card(
            margin: EdgeInsets.only(left: 16,right: 16),
            color: Color(0xFF1c1c1c),
            shape: RoundedRectangleBorder(
                side: new BorderSide(color: Colors.grey, width: 3.0),
                borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                    bottomLeft: Radius.circular(24.0),
                    bottomRight: Radius.circular(24.0))
            ),
            elevation: 8,
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Product_page()));
              },
              child: Container(
                padding: EdgeInsets.all(36),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.spatial_tracking_rounded,size: 50,color: Colors.white,),
                    SizedBox(height: 10,),
                    Text("TRACKING",style: TextStyle(color: Colors.white,fontSize: 30),)
                  ],),
              ),
            )
          ),
          SizedBox(height: 20,),
          Card(
            margin: EdgeInsets.only(left: 16,right: 16),
            color: Color(0xFF1c1c1c),
            shape: RoundedRectangleBorder(
                side: new BorderSide(color: Colors.grey, width: 3.0),
                borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                    bottomLeft: Radius.circular(24.0),
                    bottomRight: Radius.circular(24.0))
            ),
            elevation: 8,
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NearbyParcelOffices()));
              },
              child: Container(
                padding: EdgeInsets.all(36),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.near_me,size: 50,color: Colors.white,),
                    SizedBox(height: 10,),
                    Text("NEARBY OFFICE",style: TextStyle(color: Colors.white,fontSize: 30),)
                  ],),
              ),
            )
          ),
          SizedBox(height: 20,),
          Card(
            margin: EdgeInsets.only(left: 16,right: 16),
            color: Color(0xFF1c1c1c),
            shape: RoundedRectangleBorder(
                side: new BorderSide(color: Colors.grey, width: 3.0),
                borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                    bottomLeft: Radius.circular(24.0),
                    bottomRight: Radius.circular(24.0))
            ),
            elevation: 8,
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Temperature_page()));
              },
              child: Container(
                padding: EdgeInsets.all(36),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.heat_pump_rounded,size: 50,color: Colors.white,),
                    SizedBox(height: 10,),
                    Text("TEMPERATURE",style: TextStyle(color: Colors.white,fontSize: 30),)
                  ],),
              ),
            ),
          ),
          SizedBox(height: 40,),
        ],
      ),
    );
  }
}