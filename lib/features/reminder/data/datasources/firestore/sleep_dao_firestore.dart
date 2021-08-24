import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sgs/features/reminder/domain/entities/sleep.dart';

import '../sleep_dao.dart';

class SleepDAOFirestore implements   SleepDAO{
  CollectionReference sleepCollection;

SleepDAOFirestore(){
    sleepCollection = FirebaseFirestore.instance.collection('sleep');
  }

  @override
  Future<List<Sleep>> find() async {
    var result = await sleepCollection.get();
    return result.docs.map((doc) => Sleep(
          id: doc.reference.id.toString(),
          dataInicial: doc[DateTime.parse("1969-07-20 20:18:04Z")],
          dataFinal: doc[DateTime.parse("1969-07-20 20:18:04Z")],
          usuario: doc['usuario']
    )
    ).toList();
  }

  @override
  remove(id) {
   sleepCollection.doc(id).delete();
  }

  @override
  save(Sleep sleep) {
    sleepCollection.doc(sleep.id).set(
      {
      'dataInicial': sleep.dataInicial,
      'dataFinal': sleep.dataFinal,
      'usuario': sleep.usuario,
      }
    );
  }
}