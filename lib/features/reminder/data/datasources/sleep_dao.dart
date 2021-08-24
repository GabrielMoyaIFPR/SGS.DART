import 'package:sgs/features/reminder/domain/entities/sleep.dart';

abstract class SleepDAO {
  save(Sleep sleep);

  remove(dynamic id);

  Future<List<Sleep>> find();
}
