import 'package:bloc_dio_get_it/features/users/data/datasource/users_remote_datasource.dart';
import 'package:bloc_dio_get_it/features/users/domain/model/user_model.dart';
import 'package:bloc_dio_get_it/features/users/domain/repository/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersRemoteDatasource usersRemoteDatasource;

  UsersRepositoryImpl({required this.usersRemoteDatasource});

  @override
  Future<List<UserModel>> getUsers() async {
    return await usersRemoteDatasource.getUsers();
  }
}
