import 'package:sgs/features/reminder/data/connection.dart';
import 'package:sgs/features/reminder/domain/entities/user.dart';
import 'package:sqflite/sqflite.dart';

import '../user_dao.dart';

class UserDAOimpl implements UserDAO {
  Database _db;

  @override
  Future<List<User>> find() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> resultado = await _db.query('user');
    List<User> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return User(
          id: linha['id'],
          nome: linha['nome'],
          telefone: linha['telefone'],
          email: linha['email'],
          senha: linha['senha']);
    });
    return lista;
  }

  @override
  remove(int id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM user WHERE id=?';
    _db.rawDelete(sql, [id]);
  }

  @override
  save(User user) async {
    _db = await Connection.get();

    var sql;
    if (user.id == null) {
      sql =
          'INSERT INTO user (nome, telefone, email, senha)VALUES(?,?,?,?)';
      _db.rawInsert(sql,
          [user.nome, user.telefone, user.email, user.senha]);
    } else {
      sql =
          'UPDATE user SET nome =?, telefone=?, email=?, senha=? WHERE id=?';
      _db.rawUpdate(sql,
          [user.nome, user.telefone, user.email, user.senha]);
    }
  }
}
