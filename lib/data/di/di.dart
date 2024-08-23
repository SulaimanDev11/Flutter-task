import 'package:check_in_app/data/datasources/remote_datasource/remote_datasource.dart';
import 'package:check_in_app/data/datasources/remote_datasource/remote_datasource_impl.dart';
import 'package:check_in_app/data/usecase/save_data_usecase.dart';
import 'package:check_in_app/presentation/dashboard/controllers/checkin_checkout_controller.dart';
import 'package:get/get.dart';

import '../datasources/local_datasource/local_datasource.dart';
import '../datasources/local_datasource/local_datasource_impl.dart';
import '../repositories/repository.dart';
import '../repositories/repository_impl.dart';
import '../usecase/get_date_usecase.dart';

final sl = Get.find;

class Di {
  Di._();

  static void inject() {
    /// [Repository]
    Get.lazyPut<Repository>(
        () => RepositoryImpl(
              remoteDataSource: sl(),
              localDataSource: sl(),
            ),
        fenix: true);

    /// [Datasources]
    Get.lazyPut<LocalDataSource>(() => LocalDataSourceImpl(), fenix: true);
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSourceImpl(), fenix: true);

    /// [Usecases]
    Get.lazyPut<SaveUserUsecase>(() => SaveUserUsecase(repository: sl()),
        fenix: true);
    Get.lazyPut<GetDateUsecase>(() => GetDateUsecase(repository: sl()),
        fenix: true);

    /// [controller]
    Get.lazyPut<CheckInCheckOutController>(
        () => CheckInCheckOutController(
            saveUserUsecase: sl(), getDateUsecase: sl()),
        fenix: true);
  }
}
