import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:sgs/features/reminder/data/datasources/firestore/reminder_dao_firestore.dart';
import 'package:sgs/features/reminder/data/datasources/firestore/sleep_dao_firestore.dart';
import 'package:sgs/features/reminder/data/datasources/firestore/user_dao_firestore.dart';
import 'package:sgs/features/reminder/data/datasources/reminder_dao.dart';
import 'package:sgs/features/reminder/data/datasources/sleep_dao.dart';
import 'package:sgs/features/reminder/data/datasources/user_dao.dart';
import 'package:sgs/features/reminder/domain/entities/reminder_service.dart';
import 'package:sgs/features/reminder/domain/entities/sleep_service.dart';
import 'package:sgs/features/reminder/domain/entities/user_service.dart';

setupInjection() async{
  GetIt getit = GetIt.I;
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  getit.registerSingleton<UserDAO>(UserDAOFirestore());
  getit.registerSingleton<UserService>(UserService());

  getit.registerSingleton<ReminderDAO>(ReminderDAOFirestore());
  getit.registerSingleton<ReminderService>(ReminderService());
  
  getit.registerSingleton<SleepDAO>(SleepDAOFirestore());
  getit.registerSingleton<SleepService>(SleepService());

}