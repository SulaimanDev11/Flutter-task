import '../../params/params.dart';

abstract class LocalDataSource {
  Future<DateTimeParams?> getDate({required ContextParams c});
  Future<TimeParams?> getTime({required ContextParams c});
}
