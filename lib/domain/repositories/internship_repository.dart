import 'package:internshala_app/data/models/internshipList_model.dart';
import 'package:internshala_app/domain/entities/internship.dart';

abstract class InternshipRepository {
  Future<InternshipResponse> fetchInternships();
}
