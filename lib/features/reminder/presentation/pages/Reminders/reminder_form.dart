import 'package:flutter/material.dart';
import 'package:sgs/features/reminder/presentation/pages/Reminders/reminder_form_back.dart';


class ReminderForm extends StatelessWidget {
  

  Widget fieldName(ReminderFormBack back){
    return TextFormField(
      onSaved: (newValue)=>back.reminder.titulo = newValue,
      initialValue: back.reminder.titulo,
      decoration: InputDecoration(
        labelText: 'Título:'
      ),
    );
  }
  Widget fieldEmail(ReminderFormBack back){
    return TextFormField(
      onSaved: (newValue) => back.reminder.descricao = newValue,
      initialValue: back.reminder.descricao,
      decoration: InputDecoration(
        labelText: 'Descrição:'
        , hintText: 'Descrição do Texto'
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}