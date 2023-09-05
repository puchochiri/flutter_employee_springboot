import 'package:flutter/material.dart';
import 'package:flutter_employee_springboot/Screens/employeeDrawer.dart';

class getEmployees extends StatefulWidget {
  const getEmployees({super.key});

  @override
  State<getEmployees> createState() => _getEmployeesState();
}

class _getEmployeesState extends State<getEmployees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("All Employees Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => employeeDrawer()));
          },
        ),

      ),
    );
  }
}
