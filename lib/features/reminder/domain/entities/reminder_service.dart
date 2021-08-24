import 'package:sgs/features/reminder/data/datasources/reminder_dao.dart';
import 'package:sgs/features/reminder/domain/entities/reminder.dart';
import 'package:get_it/get_it.dart';

class ReminderService {
  var _dao = GetIt.I.get<ReminderDAO>();

  save(Reminder reminder) {

    _dao.save(reminder);
  }

  remove(dynamic id) {
    _dao.remove(id);
  }

  Future<List<Reminder>> find() {
    return _dao.find();
  }
}
