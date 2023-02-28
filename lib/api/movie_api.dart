import 'package:dio/dio.dart';

import '../card/movie_database.dart';
import '../model/movie_model.dart';

class EmployeeApiProvider {
  Future<List<void>> getAllEmployees() async {
    var url = "https://reqres.in/api/users?page=2";
    Response response = await Dio().get(url);

    return (response.data as List).map((employee) {
      print('Inserting $employee');
      DBProvider.db.createEmployee(Employee.fromJson(employee));
    }).toList();
  }
}