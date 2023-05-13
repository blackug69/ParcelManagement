import 'package:flutter/material.dart';

import 'UserHomePage.dart';
import 'add_product.dart';
import 'exit_confirmation_dialog.dart';
class UserMainDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                color: Color(0xFF1c1c1c),
                margin: EdgeInsets.only(top: 25,bottom: 10),
                child: Center(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:Colors.white,
                            image: DecorationImage(
                                image: AssetImage("assets/images/splash.jpeg"),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                      SizedBox(width: 10,),
                   Text("Test",style: TextStyle(fontSize: 22,color: Colors.white),),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      onTap: (){
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                            builder: (BuildContext context) => UserHomePage()), (
                            Route<dynamic> route) => false);
                      },
                      leading: Icon(Icons.home,color:Color(0xFF1c1c1c),),
                      title: Text('Home',
                        style: TextStyle(
                            fontSize: 16,color: Colors.black54),
                      ),
                    ),
                    Container(
                      height: 1,
                      margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Divider(thickness: 1,),
                    ),
                    ListTile(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddProductPage()));
                      },
                      leading: Icon(Icons.add_business,color:Color(0xFF1c1c1c),),
                      title: Text('Add Product',
                        style: TextStyle(
                            fontSize: 16,color: Colors.black54),
                      ),
                    ),
                    Container(
                      height: 1,
                      margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Divider(thickness: 1,),
                    ),
                    ListTile(
                      onTap: (){
                       showDialog(context: context, builder: (context) => ExitConfirmationDialog());
                      },
                      leading: Icon(Icons.exit_to_app,color:Color(0xFF1c1c1c),),
                      title: Text('Logout',
                        style: TextStyle(
                            fontSize: 16,color: Colors.black54),
                      ),
                    ),
                    Container(
                      height: 1,
                      margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Divider(thickness: 1,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}