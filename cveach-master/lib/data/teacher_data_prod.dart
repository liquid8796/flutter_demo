import 'dart:async';
import 'dart:convert';


import 'package:cveach/data/teacher_data.dart';
import 'package:http/http.dart' as http;


class ProdTeacherRepository implements TeacherRepository {
  String teacherUrl = "https://teacher-recruitment-api.azurewebsites.net/api/v1/Schools?page=0&perPage=20&sort=Name&search=";
  @override
  Future<List<Teacher>> fetchTeachers(String search) async {
    // TODO: implement fetchCurrencies
    http.Response response = await http.get(teacherUrl+search);
    final List responseBody = json.decode(response.body);
    final statusCode = response.statusCode;
    if (statusCode != 200 || responseBody == null) {
      throw new FetchDataException(
          "An error ocurred : [Status Code : $statusCode]");
    }

    return responseBody.map((c) => new Teacher.fromMap(c)).toList();
  }
}
