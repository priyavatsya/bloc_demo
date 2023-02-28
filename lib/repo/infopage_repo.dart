import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../API/api.dart';
import '../model/infopage_model.dart';

abstract class InfoPageRepository {
  Future<InfoPageModel> fetchDetails(String name, String job);
}

class InfoPageRepo extends InfoPageRepository {

  @override
  Future<InfoPageModel> fetchDetails(String name, String job) async {
    final response = await http.post(Uri.parse("$baseUrl/api/users"),
        body: {"name": name, "job": job});

    if (response.statusCode == 201) {
      return InfoPageModel.fromJson(response.body);
    } else {
      debugPrint("ERROR IN API CALL ${response.statusCode}");
      throw Exception('Failed to load API data');
    }
  }
}