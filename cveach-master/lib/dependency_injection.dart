

import 'data/teacher_data.dart';
import 'data/teacher_data_mock.dart';
import 'data/teacher_data_prod.dart';

enum Flavor { MOCK, PROD }

//DI
class Injector {
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  TeacherRepository get teacherRepository {
    switch (_flavor) {
      case Flavor.MOCK:
        return new MockCryptoRepository();
      default:
        return new ProdTeacherRepository();
    }
  }
}
