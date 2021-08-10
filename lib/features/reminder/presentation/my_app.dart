import 'package:flutter/material.dart';
import 'package:sgs/features/reminder/presentation/pages/Login/login_form.dart';
import 'package:sgs/features/reminder/presentation/pages/Reminders/reminder_details.dart';
import 'package:sgs/features/reminder/presentation/pages/Reminders/reminder_form.dart';
import 'package:sgs/features/reminder/presentation/pages/Reminders/reminder_list.dart';
import 'package:sgs/features/reminder/presentation/pages/Sleep/sleep_details.dart';
import 'package:sgs/features/reminder/presentation/pages/Sleep/sleep_form.dart';
import 'package:sgs/features/reminder/presentation/pages/Sleep/sleep_list.dart';
import 'package:sgs/features/reminder/presentation/pages/Users/user_details.dart';
import 'package:sgs/features/reminder/presentation/pages/Users/user_form.dart';
import 'package:sgs/features/reminder/presentation/pages/Users/user_list.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const USER_FORM = 'user-form';
  static const USER_LIST = 'user-list';
  static const USER_DETAILS = 'user-details';
  static const REMINDER_FORM = 'reminder-form';
  static const REMINDER_DETAILS = 'reminder-details';
  static const REMINDER_LIST = 'reminder-list';
  static const SLEEP_FORM = 'sleep-form';
  static const SLEEP_DETAILS = 'sleep-details';
  static const SLEEP_LIST = 'sleep-list';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema Gerenciador de Sono',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
      HOME : (context) => LoginForm(),
      USER_LIST : (context) => UserList(),
      USER_FORM: (context) => UserForm(),
      USER_DETAILS: (context) => UserDetails(),
      REMINDER_FORM: (context) => ReminderForm(),
      REMINDER_DETAILS: (context) => ReminderDetails(),
      REMINDER_LIST: (context) => ReminderList(),
      SLEEP_FORM: (context) => SleepForm(),
      SLEEP_DETAILS: (context) => SleepDetails(),
      SLEEP_LIST: (context) => SleepList(),

      }
    );
  }
}
