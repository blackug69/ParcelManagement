import 'package:flutter/material.dart';
import 'package:parcel_management/login.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ExitConfirmationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(
    height: 150,
    decoration: BoxDecoration(
        color:Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(12))
    ),
    child: Column(
      children: <Widget>[
        SizedBox(height: 24,),
        Padding(
          padding: const EdgeInsets.only(top:8.0,left: 12,right: 12,bottom: 8),
          child: Text('Are You Sure want to Logout?', style: TextStyle(fontSize: 18, color:Color(0xFF1c1c1c), fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 24,),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF1c1c1c)),
              ),
              onPressed: () async {
                final pref = await SharedPreferences.getInstance();
                await pref.clear();
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage()), (
                    Route<dynamic> route) => false);
              }, child: Text('Yes',style: TextStyle(fontWeight: FontWeight.bold),),),
            SizedBox(width: 8,),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF1c1c1c)),
              ),
              onPressed: (){
                Navigator.of(context).pop();
              }, child: Text('No',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white ))),
          ],
        )
      ],
    ),
  );
}