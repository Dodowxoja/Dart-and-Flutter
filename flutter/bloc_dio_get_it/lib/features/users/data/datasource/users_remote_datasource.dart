import 'package:bloc_dio_get_it/features/users/domain/model/user_model.dart';
import 'package:dio/dio.dart';

class UsersRemoteDatasource {
  final Dio dio;

  UsersRemoteDatasource({required this.dio});

  Future<List<UserModel>> getUsers() async {
    var result = await dio.get('users');
    return (result.data['users'] as List)
        .map((e) => UserModel.fromJson(e))
        .toList();
  }
}
