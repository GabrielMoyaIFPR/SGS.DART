
import 'package:flutter/widgets.dart';
import 'package:sgs/features/reminder/domain/entities/user.dart';

class UserDetailsBack{
  BuildContext context;
  User user;

  UserDetailsBack(this.context){
    user = ModalRoute.of(context).settings.arguments;
  }
  

  
  goToBack(){
    Navigator.of(context).pop();
  }

}