import 'package:sgs/features/reminder/domain/entities/reminder.dart';

abstract class ReminderRepository{
  Future<Reminder> getReminder(int id);
}