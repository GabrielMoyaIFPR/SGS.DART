import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sgs/features/reminder/domain/entities/reminder.dart';
import 'package:sgs/features/reminder/domain/entities/reminder_service.dart';

import 'package:sgs/features/reminder/presentation/my_app.dart';

part 'reminder_list_back.g.dart';

class ReminderListBack = _ReminderListBack with _$ReminderListBack;

abstract class _ReminderListBack with Store{
  var _service = GetIt.I.get<ReminderService>();
  
  //lista de contatos
  @observable
  Future<List<Reminder>>list;

  //metodo para atualizar a lista de contatos
  @action
  refreshList([dynamic value]){
    list = _service.find();
  }
  _ReminderListBack(){
    refreshList();
  }

  //metodo para chamar o form salvar/alterar
  goToForm(BuildContext context, [Reminder reminder]){
    Navigator.of(context).pushNamed(MyApp.REMINDER_FORM, arguments: reminder).then(refreshList);
  }

  goToDetails(BuildContext context, [Reminder reminder]){
    Navigator.of(context).pushNamed(MyApp.REMINDER_DETAILS, arguments: reminder);

  }

  //excluir
  remove(dynamic id){
    _service.remove(id);
    refreshList();
  }



}