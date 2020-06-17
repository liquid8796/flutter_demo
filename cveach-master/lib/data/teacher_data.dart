import 'dart:async';

class Teacher {
  int id;
  String Name;

  Teacher({this.id, this.Name});

  Teacher.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        Name = map['Name'];
}

abstract class TeacherRepository {
  Future<List<Teacher>> fetchTeachers(String search);
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
