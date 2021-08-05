import 'package:sgs/features/reminder/domain/entities/user.dart';
import 'package:sgs/features/reminder/domain/repositories/user_repository.dart';

class GetUser {
  final UserRepository repository;

  GetUser(this.repository);

  Future<User> execute(int id){
    return repository.getUser(id);
  }

}