import 'package:flutter/material.dart';
import 'package:flutter_employee_springboot/Screens/getEmployee.dart';
import 'package:flutter_employee_springboot/Screens/registerEmployee.dart';

class employeeDrawer extends StatefulWidget {
  const employeeDrawer({super.key});

  @override
  State<employeeDrawer> createState() => _employeeDrawerState();
}

class _employeeDrawerState extends State<employeeDrawer> {
  final minimumPadding = 5.0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Management'),
      ),
      body: Center(child: Text('Flutter - SpringBoot'),),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
          children: <Widget>[
            DrawerHeader(
                child: Text('Employee Management'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
            ),
            ListTile(
              title: Text('Register Employee'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => registerEmployee()));
              },
            ),
            ListTile(
              title: Text('Get Employees'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => getEmployees()));
              },
            ),


          ],
        ),
      ),
    );
  }
}



