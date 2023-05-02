import 'package:flutter/material.dart';
import 'package:parcel_management/signup.dart';
import 'package:parcel_management/homepage.dart';
import 'package:parcel_management/splash_screen.dart';

void main() => runApp(MaterialApp(
  theme:
  ThemeData(primaryColor: Colors.black54,accentColor:Colors.black12),
  debugShowCheckedModeBanner: false,
  home: SplashScreen(title: 'ParcelManagement!'),
));
