import 'package:get/get.dart';
import 'package:internshala_app/data/repositories/internship_repository_Iml.dart';

class DependencyCreator {
  static init() {
    Get.lazyPut(() => InternshipRepositoryIml());
  }
}
