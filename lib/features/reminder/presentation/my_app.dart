import 'package:flutter/material.dart';
import 'package:sgs/features/reminder/presentation/pages/Reminders/reminder_details.dart';
import 'package:sgs/features/reminder/presentation/pages/Reminders/reminder_form.dart';
import 'package:sgs/features/reminder/presentation/pages/Sleep/sleep_details.dart';
import 'package:sgs/features/reminder/presentation/pages/Sleep/sleep_form.dart';
import 'package:sgs/features/reminder/presentation/pages/Users/user_details.dart';
import 'package:sgs/features/reminder/presentation/pages/Users/user_form.dart';
import 'package:sgs/features/reminder/presentation/pages/Users/user_list.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const USER_FORM = 'user-form';
  static const USER_DETAILS = 'user-details';
  static const REMINDER_FORM = 'reminder-form';
  static const REMINDER_DETAILS = 'reminder-details';
  static const SLEEP_FORM = 'sleep-form';
  static const SLEEP_DETAILS = 'sleep-details';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aula Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
      HOME : (context) => UserList(),
      USER_FORM: (context) => UserForm(),
      USER_DETAILS: (context) => UserDetails(),
      REMINDER_FORM: (context) => ReminderForm(),
      REMINDER_DETAILS: (context) => ReminderDetails(),
      SLEEP_FORM: (context) => SleepForm(),
      SLEEP_DETAILS: (context) => SleepDetails(),
      }
    );
  }
}
