

import 'package:cveach/data/teacher_data.dart';

import '../dependency_injection.dart';

abstract class TeacherListViewContract {

  void onLoadTeacherComplete(List<Teacher> items);
  void onLoadTeacherError();
}

class TeacherListPresenter {
  TeacherListViewContract _view;
  TeacherRepository _repository;

  TeacherListPresenter(this._view) {
    _repository = new Injector().teacherRepository;
  }


  void loadTeachers(String search) {
    _repository
        .fetchTeachers(search)
        .then((c) => _view.onLoadTeacherComplete(c))
        .catchError((onError) => _view.onLoadTeacherError());
  }

}
