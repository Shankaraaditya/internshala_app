import 'package:get/get.dart';
import 'package:internshala_app/data/models/internship_model.dart';

class FilterController extends GetxController {
  // Reactive properties
  var isChecked = false.obs;
  var selectedDuration = Rx<int>(1);
  var selectedProfiles = <String>[].obs;
  var selectedLocations = <String>[].obs;
  var filteredInternships = 0.obs;

  // Getters
  bool get getIsChecked => isChecked.value;
  int? get getSelectedDuration => selectedDuration.value;
  List<String> get getSelectedProfiles => selectedProfiles;
  List<String> get getSelectedLocations => selectedLocations;

  // Setters and methods
  void updateIsChecked(bool value) {
    isChecked.value = value;
  }

  void updateSelectedProfiles(List<String> profiles) {
    selectedProfiles.value = profiles;
  }

  void updateSelectedLocations(List<String> locations) {
    selectedLocations.value = locations;
  }

  void updateSelectedDuration(int? value) {
    selectedDuration.value = value ?? 1;
  }

  void clearAll() {
    isChecked.value = false;
    selectedDuration.value = 1;
    selectedProfiles.clear();
    selectedLocations.clear();
  }

  // Filtering logic
  List<Internship> filterInternships(List<Internship> internships) {
    return internships.where((internship) {
      bool matchesInternship = selectedProfiles.isEmpty ||
          selectedProfiles.contains(internship.title);
      bool matchesLocation = selectedLocations.isEmpty ||
          internship.locationNames
              .any((location) => selectedLocations.contains(location));
      bool matchesDuration = selectedDuration == 1 ||
          internship.duration == ("$selectedDuration Months");
      return matchesInternship && matchesLocation && matchesDuration;
    }).toList();
  }
}
