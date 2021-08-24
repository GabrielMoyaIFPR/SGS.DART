import 'package:sgs/features/reminder/domain/entities/reminder.dart';

abstract class ReminderDAO {
  save(Reminder reminder);

  remove(dynamic id);

  Future<List<Reminder>> find();
}
