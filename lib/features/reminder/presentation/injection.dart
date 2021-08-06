

import 'package:get_it/get_it.dart';
import 'package:sgs/features/reminder/data/datasources/dao/reminder_dao_impl.dart';
import 'package:sgs/features/reminder/data/datasources/dao/sleep_dao_impl.dart';
import 'package:sgs/features/reminder/data/datasources/dao/user_dao_impl.dart';
import 'package:sgs/features/reminder/data/datasources/reminder_dao.dart';
import 'package:sgs/features/reminder/data/datasources/sleep_dao.dart';
import 'package:sgs/features/reminder/data/datasources/user_dao.dart';
import 'package:sgs/features/reminder/domain/entities/reminder_service.dart';
import 'package:sgs/features/reminder/domain/entities/sleep_service.dart';
import 'package:sgs/features/reminder/domain/entities/user_service.dart';

setupInjection(){
  GetIt getit = GetIt.I;

  getit.registerSingleton<UserDAO>(UserDAOimpl());
  getit.registerSingleton<UserService>(UserService());
  getit.registerSingleton<ReminderDAO>(ReminderDAOimpl());
  getit.registerSingleton<ReminderService>(ReminderService());
  getit.registerSingleton<SleepDAO>(SleepDAOimpl());
  getit.registerSingleton<SleepService>(SleepService());
}