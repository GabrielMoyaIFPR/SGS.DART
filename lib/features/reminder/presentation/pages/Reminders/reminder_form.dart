import 'package:flutter/material.dart';
import 'package:sgs/features/reminder/presentation/pages/Reminders/reminder_form_back.dart';


class ReminderForm extends StatelessWidget {
  
final _form = GlobalKey<FormState>();
  Widget fieldTitulo(ReminderFormBack back){
    return TextFormField(
      onSaved: (newValue)=>back.reminder.titulo = newValue,
      initialValue: back.reminder.titulo,
      decoration: InputDecoration(
        labelText: 'Título:'
      ),
    );
  }
  Widget fieldDescricao(ReminderFormBack back){
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
    var _back = ReminderFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Lembrete'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _form.currentState.validate();
                _form.currentState.save();
                
                  _back.save();
                  Navigator.of(context).pop();
                }
              )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              fieldTitulo(_back),
              fieldDescricao(_back),
            ],
          ),
        ),
      ),
    );
  }
}