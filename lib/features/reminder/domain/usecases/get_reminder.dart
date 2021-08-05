import 'package:sgs/features/reminder/domain/entities/reminder.dart';
import 'package:sgs/features/reminder/domain/repositories/reminder_repository.dart';

class GetReminder {
  final ReminderRepository repository;

  GetReminder(this.repository);

  Future<Reminder> execute(int id){
    return repository.getReminder(id);
  }

}