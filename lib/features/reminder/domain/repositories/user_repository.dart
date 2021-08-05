import 'package:sgs/features/reminder/domain/entities/user.dart';

abstract class UserRepository{
  Future<User> getUser(int id);
}