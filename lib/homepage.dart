import 'package:flutter/material.dart';
import 'package:parcel_management/temperature_page.dart';
import 'package:parcel_management/trackorder.dart';
import 'package:parcel_management/nearby_office.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: [
                  GridTile(
                    child: Container(
                      color: Colors.blue,
                      child: Center(
                        child: TextButton(
                          child: const Text(
                            "TRACKING",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TrackOrder()));
                            //signup screen
                          },
                        ),
                      ),
                    ),
                  ),
                  GridTile(
                    child: Container(
                      color: Colors.green,
                      child: Center(
                        child: TextButton(
                          child: const Text(
                            "NEARBY OFFICE",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => NearbyParcelOffices()));
                          },
                        ),
                      ),
                    ),
                  ),
                  GridTile(
                    child: Container(
                      color: Colors.orange,
                      child: Center(
                        child: TextButton(
                          child: const Text(
                            "TEMPERATURE",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Temperature_page()));
                            //signup screen
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
