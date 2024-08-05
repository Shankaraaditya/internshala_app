import 'package:internshala_app/app/core/usecases/no_param_usecase.dart';
import 'package:internshala_app/data/models/internshipList_model.dart';
import 'package:internshala_app/domain/repositories/internship_repository.dart';

class FetchInternshipUseCase extends NoParamUseCase<InternshipResponse> {
  final InternshipRepository _repo;
  FetchInternshipUseCase(this._repo);

  @override
  Future<InternshipResponse> execute() {
   return  _repo.fetchInternships();
  }
}
