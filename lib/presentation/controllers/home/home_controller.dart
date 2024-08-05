import 'package:get/get.dart';
import 'package:internshala_app/data/models/internshipList_model.dart';

import 'package:internshala_app/domain/usecases/fetch_internship_use_case.dart';

class HomeController extends GetxController {
  final FetchInternshipUseCase fetchInternshipUseCase;
  HomeController(this.fetchInternshipUseCase) {
    fetchInternships();
    print("internship response is ${internshipResponse?.internshipsMeta}");
  }

  final _internshipResponse = Rxn<InternshipResponse>();
  var _isLoading = false.obs;

  InternshipResponse? get internshipResponse => _internshipResponse.value;
  bool get isLoading => _isLoading.value;

  void fetchInternships() async {
    _isLoading.value = true;

    try {
      // Fetch data using the use case
      final response = await fetchInternshipUseCase.execute();
      print("Responsessss is $response");
      _internshipResponse.value = response;
      print('Internships fetched successfully');
    } catch (e) {
      print('Error fetching internships: $e');
    } finally {
      _isLoading.value = false;
    }
  }
}
