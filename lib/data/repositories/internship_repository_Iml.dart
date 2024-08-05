
import 'dart:developer';

import 'package:internshala_app/data/models/internshipList_model.dart';
import 'package:internshala_app/data/providers/network/apis/internship_api.dart';
import 'package:internshala_app/domain/repositories/internship_repository.dart';

import 'dart:convert';

class InternshipRepositoryIml extends InternshipRepository {
  @override
  Future<InternshipResponse> fetchInternships() async {
    try {
      log("Fetching internships from API");
      final response = await InternshalaAPI.fetchInternships().request();
      
      // Ensure that the response is a string containing JSON data
      final Map<String, dynamic> decodedResponse = jsonDecode(response);
      log("Internships fetched successfully");

      return InternshipResponse.fromJson(decodedResponse);
    } catch (e) {
      log("Error fetching internships: $e");
      throw Exception("Failed to fetch internships");
    }
  }
}

