import 'package:flutter/material.dart';
import 'package:sgs/features/reminder/presentation/pages/user_details.dart';
import 'package:sgs/features/reminder/presentation/pages/user_list.dart';
import 'package:sgs/features/reminder/presentation/widgets/user_form.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const USER_FORM = 'user-form';
  static const USER_DETAILS = 'user-details';
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
      }
    );
  }
}
