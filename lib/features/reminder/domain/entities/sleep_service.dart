import 'package:sgs/features/reminder/data/datasources/sleep_dao.dart';
import 'package:sgs/features/reminder/domain/entities/sleep.dart';
import 'package:get_it/get_it.dart';

class SleepService {
  var _dao = GetIt.I.get<SleepDAO>();

  save(Sleep sleep) {

    _dao.save(sleep);
  }

  remove(dynamic id) {
    _dao.remove(id);
  }

  Future<List<Sleep>> find() {
    return _dao.find();
  }
}
