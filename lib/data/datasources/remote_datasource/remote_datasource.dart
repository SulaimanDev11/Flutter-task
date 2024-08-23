import 'package:check_in_app/data/params/params.dart';

abstract class RemoteDataSource {
  Future<bool> saveUserData({required SaveUserParams params});
}
