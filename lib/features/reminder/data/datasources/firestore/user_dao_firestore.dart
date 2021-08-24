import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sgs/features/reminder/domain/entities/user.dart';

import '../user_dao.dart';

class UserDAOFirestore implements   UserDAO{
  CollectionReference userCollection;

 UserDAOFirestore(){
    userCollection = FirebaseFirestore.instance.collection('user');
  }

  @override
  Future<List<User>> find() async {
    var result = await userCollection.get();
    return result.docs.map((doc) => User(
          id: doc.reference.id.toString(),
          nome: doc['nome'],
          telefone: doc['telefone'],
          email: doc['email'],
          senha: doc['senha']
    )
    ).toList();
  }

  @override
  remove(id) {
   userCollection.doc(id).delete();
  }

  @override
  save(User user) {
    userCollection.doc(user.id).set(
      {
      'nome': user.nome,
      'telefone': user.telefone,
      'email': user.email,
      'senha': user.senha
      }
    );
  }
}