import 'package:sgs/features/reminder/data/datasources/user_dao.dart';
import 'package:sgs/features/reminder/domain/entities/Exception/domain_layer_exception.dart';
import 'package:sgs/features/reminder/domain/entities/user.dart';
import 'package:get_it/get_it.dart';

class UserService {
  var _dao = GetIt.I.get<UserDAO>();

  save(User user) {
    validateName(user.nome);
    validateEmail(user.email);
    validatePhone(user.telefone);
    validatePassword(user.senha);
    _dao.save(user);
  }

  remove(int id) {
    _dao.remove(id);
  }

  Future<List<User>> find() {
    return _dao.find();
  }

  validateName(String name) {
    var min = 3;
    var max = 50;
    if (name == null) {
      throw new DomainLayerException('O nome é obrigatório');
    } else if (name.length < min) {
      throw new DomainLayerException(
          'O nome deve possuir pelo menos $min carácteres');
    } else if (name.length > max) {
      throw new DomainLayerException(
          'O nome deve possuir no máximo $max carácteres');
    }
  }

  validateEmail(String email) {
    if (email == null) {
      throw new DomainLayerException('O e-mail é obrigatório');
    } else if (!email.contains('@')) {
      throw new DomainLayerException('O e-mail deve possuir @');
    }
  }

  validatePhone(String phone) {
    var format = RegExp(r'^\([1-9]{2}\)[9] [6-9]{1}[0-9]{3}\-[0-9]{4}$');
    if (phone == null) {
      throw new DomainLayerException('O telefone é obrigatório');
    } else if (!format.hasMatch(phone)) {
      throw new DomainLayerException(
          'Formato do telefone inválido. O formato deve ser (99)99999-9999');
    }
  }

  validatePassword(String senha) {
    var min = 8;
    var max = 50;
    if (senha == null) {
      throw new DomainLayerException('A senha é obrigatória');
    } else if (senha.length < min) {
      throw new DomainLayerException(
          'A senha deve possuir pelo menos $min carácteres');
    } else if (senha.length > max) {
      throw new DomainLayerException(
          'A senha deve possuir no máximo $max carácteres');
    }
  }
}
