import 'package:flutter/material.dart';
import 'package:flutter_employee_springboot/Screens/deleteEmployee.dart';
import 'package:flutter_employee_springboot/Screens/employeeDrawer.dart';
import 'package:flutter_employee_springboot/Screens/updateEmployees.dart';
import 'package:http/http.dart' as http;
import '../Model/employeeModel.dart';
import 'dart:convert';

class getEmployees extends StatefulWidget {
  const getEmployees({super.key});

  @override
  State<getEmployees> createState() => _getEmployeesState();
}

class _getEmployeesState extends State<getEmployees> {
  var employees = List<EmployeeModel>.generate(200, (index) => null!);

  Future <List<EmployeeModel>?>getEmployees() async{
    var Url = Uri.parse('http://localhost:8080/getallemployees');
    var data = await http.get(Url);
    var jsonData = json.decode(data.body);

    List<EmployeeModel> employee = [];
    for (var e in jsonData){
      EmployeeModel employees = new EmployeeModel();
      employees.id = e["id"];
      employees.firstName = e["firstName"];
      employees.lastName = e["lastName"];
      employee.add(employees);

    }
    return employee;

  }




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
      body: Container(
        child: FutureBuilder(
            future: getEmployees(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.data == null){
                return Container(
                  child: Center(child: Icon(Icons.error),),
                );
              }
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        'ID' + ' ' + 'FirstName' + ' ' + ' Last Name'
                      ),
                      subtitle: Text(
                         '${snapshot.data[index].id}' + '${snapshot.data[index].firstName}' + '${snapshot.data[index].lastName}'
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage((snapshot.data[index]))));

                      },
                    );
                  }
              );
            }
        ),

      ),
    );
  }
}

class DetailPage extends StatelessWidget {


  EmployeeModel employeeModel;
    DetailPage(this.employeeModel);

    deleteEmployee1(EmployeeModel employeeModel) async {
      final Url = Uri.parse('http://localhost:8080/getallemployees');
      final request = http.Request("DELETE", Url);
      request.headers.addAll(<String, String>{
        "Content-type":"application/json"
      });
      request.body = jsonEncode(employeeModel);
      final response = await request.send();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(employeeModel.firstName!), actions: [
          IconButton(
               
              icon: Icon(Icons.edit),
            color: Colors.white,
            onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => updateEmployee()));
            },
          )
      ],
      ),
      body: Container(
        child: Text('FirstName' + ' ' + employeeModel.firstname + ' ' + 'LastName' + employeeModel.lastname),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          deleteEmployee1(employeeModel);
          Navigator.push(context, MaterialPageRoute(builder: (context) => deleteEmployee()));
        },
        child: Icon(Icons.delete),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
