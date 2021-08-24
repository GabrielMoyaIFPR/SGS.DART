import 'package:sgs/features/reminder/data/connection.dart';
import 'package:sgs/features/reminder/data/datasources/sleep_dao.dart';
import 'package:sgs/features/reminder/domain/entities/sleep.dart';
import 'package:sqflite/sqflite.dart';

import '../sleep_dao.dart';

class SleepDAOimpl implements SleepDAO {
  Database _db;

  @override
  Future<List<Sleep>> find() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> resultado = await _db.query('sleep');
    List<Sleep> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Sleep(
          id: linha['id'],
          dataInicial: linha[DateTime.parse("1969-07-20 20:18:04Z")],
          dataFinal: linha[DateTime.parse("1969-07-20 20:18:04Z")],
          usuario: linha['usuario']);
    });
    return lista;
  }

  @override
  remove(dynamic id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM sleep WHERE id=?';
    _db.rawDelete(sql, [id]);
  }

  @override
  save(Sleep sleep) async {
    _db = await Connection.get();

    var sql;
    if (sleep.id == null) {
      sql =
          'INSERT INTO sleep (dataInicial, dataFinal, usuario)VALUES(?,?,?)';
      _db.rawInsert(sql,
          [sleep.dataInicial, sleep.dataFinal, sleep.usuario]);
    } else {
      sql =
          'UPDATE sleep SET dataInicial =?, dataFinal=?, usuario=? WHERE id=?';
      _db.rawUpdate(sql,
          [sleep.dataInicial, sleep.dataFinal, sleep.usuario]);
    }
  }
}
