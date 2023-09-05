import 'package:flutter/material.dart';
import 'package:flutter_employee_springboot/Screens/employeeDrawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EmployeeManagement',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: employeeDrawer(),


    );
  }
}
