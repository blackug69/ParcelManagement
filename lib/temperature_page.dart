import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Temperature_page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TemperaturePage();
  }
}

class _TemperaturePage extends State<Temperature_page> {
  String? data;
  var all_data;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        "https://bluebirdgo.000webhostapp.com/API/viewtempdata%20(1).php"));

    if (response.statusCode == 200) {
      data = response.body;
      print(response.body);
      setState(() {
        all_data = jsonDecode(data!)['temperature'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Temperature"),
      ),
      body: ListView.builder(
        itemCount: all_data == null ? 0 : all_data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                        jsonDecode(data!)['temperature'][index]['hum_value']),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      jsonDecode(data!)['temperature'][index]['reading_value'],
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
