import 'package:sgs/features/reminder/domain/entities/user.dart';

abstract class UserDAO {
  save(User user);

  remove(int id);

  Future<List<User>> find();
}
