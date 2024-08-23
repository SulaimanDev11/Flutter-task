import 'package:check_in_app/data/params/params.dart';

import '../repositories/repository.dart';
import 'usecase.dart';

class GetDateUsecase extends Usecase<DateTimeParams?, ContextParams> {
  final Repository repository;

  GetDateUsecase({required this.repository});

  @override
  Future<DateTimeParams?> call(ContextParams params) async {
    return await repository.getDate(params: params);
  }
}
