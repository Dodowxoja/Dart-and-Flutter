import 'package:bloc_dio_get_it/features/users/domain/model/user_model.dart';

abstract class UsersRepository {
  Future<List<UserModel>> getUsers();
}