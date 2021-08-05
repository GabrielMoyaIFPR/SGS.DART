import 'package:sgs/features/reminder/domain/entities/sleep.dart';
import 'package:sgs/features/reminder/domain/repositories/sleep_repository.dart';

class GetSleep {
  final SleepRepository repository;

  GetSleep(this.repository);

  Future<Sleep> execute(int id){
    return repository.getSleep(id);
  }

}