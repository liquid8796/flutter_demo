import 'dart:async';

import 'package:cveach/data/teacher_data.dart';



class MockCryptoRepository implements TeacherRepository {
  @override
  Future<List<Teacher>> fetchTeachers(String search) {
    // TODO: implement fetchCurrencies
    return new Future.value(teachers);
  }
}

var teachers = <Teacher>[
  new Teacher(id: 1, Name: "FPT"),
  new Teacher(id: 1, Name: "UEH"),

];
