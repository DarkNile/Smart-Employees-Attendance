import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/welcome_screen.dart';
import 'screens/scan_screen.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //SharedPreferences prefs = await SharedPreferences.getInstance();
  //var token = prefs.getString('track');
  runApp(MaterialApp(
    title: 'DTC Smart Employee Attendance App',
    debugShowCheckedModeBanner: false,
    //home: token == null ? Welcome() : ScanScreen()
    home: Welcome(),
  ));
}
