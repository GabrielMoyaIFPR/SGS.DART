

import 'package:get_it/get_it.dart';
import 'package:sgs/features/reminder/data/datasources/dao/user_dao_impl.dart';
import 'package:sgs/features/reminder/data/datasources/user_dao.dart';
import 'package:sgs/features/reminder/domain/entities/user_service.dart';

setupInjection(){
  GetIt getit = GetIt.I;

  getit.registerSingleton<UserDAO>(UserDAOimpl());
  getit.registerSingleton<UserService>(UserService());
}