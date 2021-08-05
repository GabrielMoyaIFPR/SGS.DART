
import 'package:flutter/widgets.dart';
import 'package:sgs/features/reminder/domain/entities/reminder.dart';

class ReminderDetailsBack{
  BuildContext context;
  Reminder reminder;

  ReminderDetailsBack(this.context){
    reminder = ModalRoute.of(context).settings.arguments;
  }
  

  
  goToBack(){
    Navigator.of(context).pop();
  }

}