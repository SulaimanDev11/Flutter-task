import 'package:check_in_app/data/params/params.dart';

abstract class Repository {
  Future<bool> saveUserData(SaveUserParams params);
  Future<DateTimeParams?> getDate({required ContextParams params});
  Future<TimeParams?> getTime({required ContextParams params});
}
