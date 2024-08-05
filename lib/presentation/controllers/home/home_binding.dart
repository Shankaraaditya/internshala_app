import 'package:get/get.dart';
import 'package:internshala_app/data/repositories/internship_repository_Iml.dart';
import 'package:internshala_app/domain/usecases/fetch_internship_use_case.dart';
import 'package:internshala_app/presentation/controllers/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    print('HomeBinding dependencies called');
    Get.lazyPut<InternshipRepositoryIml>(() => InternshipRepositoryIml());
    Get.lazyPut<FetchInternshipUseCase>(() => FetchInternshipUseCase(Get.find<InternshipRepositoryIml>()));
    Get.lazyPut<HomeController>(() => HomeController(Get.find<FetchInternshipUseCase>()));
  }
}
