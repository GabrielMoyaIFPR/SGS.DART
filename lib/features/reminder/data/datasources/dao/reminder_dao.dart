import 'package:sgs/features/reminder/domain/entities/reminder.dart';

abstract class ReminderDAO {
  save(Reminder reminder);

  remove(int id);

  Future<List<Reminder>> find();
}
