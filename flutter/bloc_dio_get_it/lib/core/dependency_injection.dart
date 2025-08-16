import 'package:bloc_dio_get_it/core/api/api_client.dart';
import 'package:bloc_dio_get_it/features/users/data/datasource/users_remote_datasource.dart';
import 'package:bloc_dio_get_it/features/users/data/repository/users_repository_impl.dart';
import 'package:bloc_dio_get_it/features/users/domain/repository/users_repository.dart';
import 'package:bloc_dio_get_it/features/users/presentation/bloc/users_bloc.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton(ApiClient());
  getIt.registerSingleton(getIt<ApiClient>().getDio());
  getIt.registerLazySingleton(() => UsersRemoteDatasource(dio: getIt()));
  getIt.registerLazySingleton<UsersRepository>(
    () => UsersRepositoryImpl(usersRemoteDatasource: getIt()),
  );

  getIt.registerFactory(() => UsersBloc(getIt()));
}
