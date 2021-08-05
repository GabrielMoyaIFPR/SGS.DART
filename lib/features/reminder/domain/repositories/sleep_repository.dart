import 'package:sgs/features/reminder/domain/entities/sleep.dart';

abstract class SleepRepository{
  Future<Sleep> getSleep(int id);
}