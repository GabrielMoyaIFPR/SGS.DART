import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:sgs/features/reminder/domain/entities/reminder.dart';
import 'package:sgs/features/reminder/domain/entities/reminder_service.dart';



class ReminderFormBack {
  Reminder reminder;
  var _service = GetIt.I.get<ReminderService>();
 
  //diferenciar novo com alteração
  ReminderFormBack(BuildContext context){
    var parameter = ModalRoute.of(context).settings.arguments;
    reminder=(parameter==null)? Reminder(id: null, titulo: null, descricao: null): parameter;
  }

  //salvar
  save()async{
    await _service.save(reminder);
  }
  

}