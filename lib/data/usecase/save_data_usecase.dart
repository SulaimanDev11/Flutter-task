import 'package:check_in_app/data/params/params.dart';

import '../repositories/repository.dart';
import 'usecase.dart';

class SaveUserUsecase extends Usecase<void, SaveUserParams> {
  final Repository repository;

  SaveUserUsecase({required this.repository});

  @override
  Future<bool> call(SaveUserParams params) async {
    return await repository.saveUserData(params);
  }
}
