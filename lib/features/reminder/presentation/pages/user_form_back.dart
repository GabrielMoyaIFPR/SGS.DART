import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:sgs/features/reminder/domain/entities/user.dart';
import 'package:sgs/features/reminder/domain/entities/user_service.dart';



class UserFormBack {
  User user;
  var _service = GetIt.I.get<UserService>();
  bool _nameIsValid;
  bool _emailIsValid;
  bool _telefoneIsValid;

  
  bool get isValid=> _nameIsValid && _emailIsValid && _telefoneIsValid;

  //diferenciar novo com alteração
  UserFormBack(BuildContext context){
    var parameter = ModalRoute.of(context).settings.arguments;
    user=(parameter==null)? User(email: '', nome: '', id: null, senha: '', telefone: ''): parameter;
  }
  

  //salvar
  save()async{
    await _service.save(user);
  }

  //validações
  String validateName(String name){
    try{
      _service.validateName(name);
      _nameIsValid =true;
      return null;
    }catch(e){
      _nameIsValid= false;
      return e.toString();
    }
  }

  String validateEmail(String email){
    try{
      _service.validateEmail(email);
      _emailIsValid =true;
      return null;
    }catch(e){
      _emailIsValid = false;
      return e.toString();
    }
  }
  String validatePhone(String phone){
    try{
      _service.validatePhone(phone);
      _telefoneIsValid =true;
      return null;
    }catch(e){
      _telefoneIsValid= false;
      return e.toString();
    }
  }

}