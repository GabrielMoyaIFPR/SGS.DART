import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sgs/features/reminder/data/datasources/reminder_dao.dart';
import 'package:sgs/features/reminder/domain/entities/reminder.dart';

class ReminderDAOFirestore implements ReminderDAO{
  CollectionReference reminderCollection;

  ReminderDAOFirestore(){
    reminderCollection = FirebaseFirestore.instance.collection('reminder');
  }

  @override
  Future<List<Reminder>> find() async {
    var result = await reminderCollection.get();
    return result.docs.map((doc) => Reminder(
          id: doc.reference.id.toString(),
          descricao: doc['descricao'],
          titulo: doc['titulo']
    )
    ).toList();
  }

  @override
  remove(id) {
   reminderCollection.doc(id).delete();
  }

  @override
  save(Reminder reminder) {
    reminderCollection.doc(reminder.id).set(
      {
      'descricao': reminder.descricao,
      'titulo': reminder.titulo
      }
    );
  }
}