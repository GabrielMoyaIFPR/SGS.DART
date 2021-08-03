import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sgs/features/reminder/domain/entities/user.dart';
import 'package:sgs/features/reminder/domain/entities/user_service.dart';
import 'package:sgs/features/reminder/presentation/my_app.dart';


class UserListBack = _UserListBack with _$UserListBack;

abstract class _UserListBack with Store{
  var _service = GetIt.I.get<UserService>();
  
  //lista de contatos
  @observable
  Future<List<User>>list;

  //metodo para atualizar a lista de contatos
  @action
  refreshList([dynamic value]){
    list = _service.find();
  }
  _UserListBack(){
    refreshList();
  }

  //metodo para chamar o form salvar/alterar
  goToForm(BuildContext context, [User user]){
    Navigator.of(context).pushNamed(MyApp.USER_FORM, arguments: user).then(refreshList);
  }

  goToDetails(BuildContext context, [User user]){
    Navigator.of(context).pushNamed(MyApp.USER_DETAILS, arguments: user);

  }

  //excluir
  remove(int id){
    _service.remove(id);
    refreshList();
  }



}