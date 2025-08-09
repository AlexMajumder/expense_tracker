import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../../app/set_up_dio.dart';
import '../../features/auth/data/sources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_use_case.dart';
import '../../features/auth/presentation/bloc/login_bloc.dart';
import '../network_executor/network_executor.dart';
import '../network_executor/error_mapper/default_error_mapper.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Dio instance
  Dio dio = getDioInstance();

  // Network executor (you can customize error handling here)
  sl.registerLazySingleton<NetworkExecutor>(() => NetworkExecutor(
    dio: dio,
    errorMapper: DefaultErrorMapper(
      onUnauthorized: () {
        // TODO: Handle logout or refresh token
      },
    ),
  ));

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
          () => AuthRemoteDataSourceImpl(dio));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
          () => AuthRepositoryImpl(sl<AuthRemoteDataSource>()));

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl<AuthRepository>()));

  // Blocs
  sl.registerFactory(() => LoginBloc(sl<LoginUseCase>()));
}
