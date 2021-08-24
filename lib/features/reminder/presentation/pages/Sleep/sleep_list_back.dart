import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sgs/features/reminder/domain/entities/sleep.dart';
import 'package:sgs/features/reminder/domain/entities/sleep_service.dart';
import 'package:sgs/features/reminder/presentation/my_app.dart';

part 'sleep_list_back.g.dart';

class SleepListBack = _SleepListBack with _$SleepListBack;

abstract class _SleepListBack with Store{
  var _service = GetIt.I.get<SleepService>();
  
  //lista de contatos
  @observable
  Future<List<Sleep>>list;

  //metodo para atualizar a lista de contatos
  @action
  refreshList([dynamic value]){
    list = _service.find();
  }
  _SleepListBack(){
    refreshList();
  }

  //metodo para chamar o form salvar/alterar
  goToForm(BuildContext context, [Sleep sleep]){
    Navigator.of(context).pushNamed(MyApp.SLEEP_FORM, arguments: sleep).then(refreshList);
  }

  goToDetails(BuildContext context, [Sleep sleep]){
    Navigator.of(context).pushNamed(MyApp.SLEEP_DETAILS, arguments: sleep);

  }

  //excluir
  remove(dynamic id){
    _service.remove(id);
    refreshList();
  }



}

