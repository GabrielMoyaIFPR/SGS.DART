import 'package:sgs/features/reminder/data/connection.dart';
import 'package:sgs/features/reminder/domain/entities/reminder.dart';
import 'package:sqflite/sqflite.dart';

import '../reminder_dao.dart';

class ReminderDAOimpl implements ReminderDAO {
  Database _db;

  @override
  Future<List<Reminder>> find() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> resultado = await _db.query('reminder');
    List<Reminder> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Reminder(
          id: linha['id'],
          descricao: linha['descricao'],
          titulo: linha['titulo']);
    });
    return lista;
  }

  @override
  remove(int id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM reminder WHERE id=?';
    _db.rawDelete(sql, [id]);
  }

  @override
  save(Reminder reminder) async {
    _db = await Connection.get();

    var sql;
    if (reminder.id == null) {
      sql =
          'INSERT INTO reminder (descricao, titulo)VALUES(?,?)';
      _db.rawInsert(sql,
          [reminder.descricao, reminder.titulo]);
    } else {
      sql =
          'UPDATE reminder SET descricao =?, titulo=? WHERE id=?';
      _db.rawUpdate(sql,
          [reminder.descricao, reminder.titulo]);
    }
  }
}
