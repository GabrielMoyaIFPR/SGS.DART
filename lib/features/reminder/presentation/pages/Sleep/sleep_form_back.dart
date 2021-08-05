import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:sgs/features/reminder/domain/entities/sleep.dart';
import 'package:sgs/features/reminder/domain/entities/sleep_service.dart';



class SleepFormBack {
  Sleep sleep;
  var _service = GetIt.I.get<SleepService>();
  bool _nameIsValid;
  bool _emailIsValid;
  bool _telefoneIsValid;

  
  bool get isValid=> _nameIsValid && _emailIsValid && _telefoneIsValid;

  //diferenciar novo com alteração
  SleepFormBack(BuildContext context){
    var parameter = ModalRoute.of(context).settings.arguments;
    sleep=(parameter==null)? Sleep(id: null, dataFinal: null, dataInicial: null, usuario: null, ): parameter;
  }
  

  //salvar
  save()async{
    await _service.save(sleep);
  }

  //validações
  

}