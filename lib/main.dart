import 'package:flutter/material.dart';
import 'package:sgs/features/reminder/presentation/injection.dart';
import 'package:sgs/features/reminder/presentation/my_app.dart';


void main() {
  setupInjection();
  runApp(MyApp());
}
