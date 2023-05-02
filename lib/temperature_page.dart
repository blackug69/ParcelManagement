import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Temperature_page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TemperaturePage();
  }
}

class _TemperaturePage extends State<Temperature_page> {
  String? data;
  var all_data;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    setState(() {
      isLoading = true;
    });
    http.Response response = await http.get(Uri.parse(
        "https://bluebirdgo.000webhostapp.com/API/viewtempdata%20(1).php"));

    if (response.statusCode == 200) {
      data = response.body;
      print(response.body);
      setState(() {
        isLoading = false;
        all_data = jsonDecode(data!)['temperature'];
      });
    }
  }

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
            Text("Temperature",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
          ],
        ),
      ),
      body: isLoading ? Center(child: CircularProgressIndicator(color: Color(0xFF1c1c1c))) :  ListView.builder(
        itemCount: all_data == null ? 0 : all_data.length,
        padding: EdgeInsets.only(top: 16),
        itemBuilder: (BuildContext context, int index) {
          return Card(
              margin: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
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
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(left: 16,right: 16,top: 24,bottom: 8),
                    child: Row(
                      children: [
                        Text("Reading Time: ", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                        Text(jsonDecode(data!)['temperature'][index]['reading_value'],
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal))
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 24),
                    child: Row(
                      children: [
                        Text("Value: ", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                        Text(jsonDecode(data!)['temperature'][index]['hum_value'],
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal))
                      ],
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
