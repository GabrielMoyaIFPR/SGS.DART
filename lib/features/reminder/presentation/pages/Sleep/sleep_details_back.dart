
import 'package:flutter/widgets.dart';
import 'package:sgs/features/reminder/domain/entities/sleep.dart';

class SleepDetailsBack{
  BuildContext context;
  Sleep sleep;

  SleepDetailsBack(this.context){
    sleep = ModalRoute.of(context).settings.arguments;
  }
  

  
  goToBack(){
    Navigator.of(context).pop();
  }

}