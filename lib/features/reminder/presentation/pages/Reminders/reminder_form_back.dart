import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:sgs/features/reminder/domain/entities/reminder.dart';
import 'package:sgs/features/reminder/domain/entities/reminder_service.dart';



class ReminderFormBack {
  Reminder reminder;
  var _service = GetIt.I.get<ReminderService>();
  bool _nameIsValid;
  bool _emailIsValid;
  bool _telefoneIsValid;

  
  bool get isValid=> _nameIsValid && _emailIsValid && _telefoneIsValid;

  //diferenciar novo com alteração
  ReminderFormBack(BuildContext context){
    var parameter = ModalRoute.of(context).settings.arguments;
    reminder=(parameter==null)? Reminder(id: null, titulo: '', descricao: ''): parameter;
  }
  

  //salvar
  save()async{
    await _service.save(reminder);
  }

  //validações
  

}