import 'package:flutter/material.dart';
import 'package:flutter_employee_springboot/Screens/getEmployee.dart';

class deleteEmployee extends StatefulWidget {
  const deleteEmployee({super.key});

  @override
  State<deleteEmployee> createState() => _deleteEmployeeState();
}

class _deleteEmployeeState extends State<deleteEmployee> {
  @override
  Widget build(BuildContext context) {
    return getEmployees();
  }
}
