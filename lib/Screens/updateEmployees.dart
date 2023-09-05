import 'package:flutter/material.dart';

class updateEmployee extends StatefulWidget {
  const updateEmployee({super.key});

  @override
  State<updateEmployee> createState() => _updateEmployeeState();
}

class _updateEmployeeState extends State<updateEmployee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Employee'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back
          ),
          onPressed: (){

          },
        ),
      ),
    );
  }
}
