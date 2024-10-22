import 'package:blog/core/error/failures.dart';
import 'package:blog/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:blog/features/auth/domain/repository/i_auth_repository.dart';
import 'package:fpdart/src/either.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(AuthRemoteDataSource authRemoteDataSource);

  @override
  Future<Either<Failures, String>> loginWithEmailPassword(
      {required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, String>> signUpWithEmailPassword(
      {required String name, required String email, required String password}) {
    // TODO: implement signUpWithEmailPassword
    throw UnimplementedError();
  }
}
