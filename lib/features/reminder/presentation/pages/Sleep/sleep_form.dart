import 'package:flutter/material.dart';
import 'package:sgs/features/reminder/presentation/pages/Sleep/sleep_form_back.dart';

class SleepForm extends StatelessWidget {

  final _form = GlobalKey<FormState>();
  
  Widget fieldDataInicial(SleepFormBack back){
    return TextFormField(
      onSaved: (newValue)=>back.sleep.dataInicial = newValue as DateTime,
      decoration: InputDecoration(
        labelText: 'Data Inicial:'
      ),
    );
  }
  Widget fieldDataFinal(SleepFormBack back){
    return TextFormField(
      onSaved: (newValue) => back.sleep.dataFinal = newValue as DateTime,
      decoration: InputDecoration(
        labelText: 'Data Final:'
      ),
    );
  }

 @override
  Widget build(BuildContext context) {
    var _back = SleepFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Período Sono'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _form.currentState.validate();
                _form.currentState.save();
                _back.save();
                  Navigator.of(context).pop();
                
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              fieldDataInicial(_back),
              fieldDataFinal(_back),
            ],
          ),
        ),
      ),
    );
  }
  
}