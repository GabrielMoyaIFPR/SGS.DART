import 'package:flutter/material.dart';
import 'package:sgs/features/reminder/presentation/pages/Sleep/sleep_form_back.dart';


class SleepForm extends StatelessWidget {
  

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
    // TODO: implement build
    throw UnimplementedError();
  }
  
}