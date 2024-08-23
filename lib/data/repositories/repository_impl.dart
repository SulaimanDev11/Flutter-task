import 'package:check_in_app/data/datasources/local_datasource/local_datasource.dart';
import 'package:check_in_app/data/datasources/remote_datasource/remote_datasource.dart';
import 'package:check_in_app/data/params/params.dart';
import 'repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  RepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<bool> saveUserData(SaveUserParams params) async {
    return await remoteDataSource.saveUserData(params: params);
  }

  @override
  Future<DateTimeParams?> getDate({required ContextParams params}) {
    return localDataSource.getDate(c: params);
  }

  @override
  Future<TimeParams?> getTime({required ContextParams params}) {
    return localDataSource.getTime(c: params);
  }
}
