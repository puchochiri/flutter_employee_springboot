import 'dart:convert';
import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_employee_springboot/Model/employeeModel.dart';

import 'package:http/http.dart' as http;


class registerEmployee extends StatefulWidget {
  const registerEmployee({super.key});

  @override
  State<registerEmployee> createState() => _registerEmployeeState();
}

Future<EmployeeModel?> registerEmployees(
 String firstName, String lastName, BuildContext context
) async {
  var url = Uri.parse("http://localhost:8080/addemployee");
  var response = await http.post(url,
  headers:<String, String>{"Content-Type": "application/json"},
  body:jsonEncode(<String, String>{
    "firstName" : firstName,
    "lastName"  : lastName,
  }));
  String responseString = response.body;
  if(response.statusCode == 200){
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext dialogContext) {
          return MyAlertDialog(title : 'Backend Response', content : response.body);
        },
    );

  } else {

    throw Exception('Failed to register employee');


  }
}



class _registerEmployeeState extends State<registerEmployee> {
  final minimumPadding = 5.0;
  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();

  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme
        .of(context)
        .textTheme
        .titleSmall;
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Employee"),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(minimumPadding * 2),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: minimumPadding, bottom: minimumPadding),
                child: TextFormField(
                  style: textStyle,
                  controller: firstController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'please enter first your name';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'First Name',
                      hintText: 'Enter Your First Name',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: minimumPadding, bottom: minimumPadding),
                child: TextFormField(
                  style: textStyle,
                  controller: lastController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'please enter last your name';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Last Name',
                      hintText: 'Enter Your First Name',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                ),
              ),
              ElevatedButton(
                child: Text('Submit'),
                onPressed: () {}
              ),

            ],
          ),
        ),)
      ,
    );
  }
}



class MyAlertDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final List<Widget>actions;

  const MyAlertDialog({
    this.title,
    this.content,
    this.actions = const[],
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        this.title!,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      actions: this.actions,
      content: Text(
        this.content!,
        style: Theme.of(context).textTheme.bodyLarge,
      ),

    );
  }
}
