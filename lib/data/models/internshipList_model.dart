
import 'dart:developer';

import 'package:internshala_app/data/models/internship_model.dart';

class InternshipResponse {
  final Map<int, Internship> internshipsMeta;

  InternshipResponse({required this.internshipsMeta});

  factory InternshipResponse.fromJson(Map<String, dynamic> json) {
    Map<int, Internship> internshipsMap = {};
    json['internships_meta'].forEach((key, value) {
      internshipsMap[int.parse(key)] = Internship.fromJson(value);
    });
    log('InternshipResponse: $internshipsMap');
    return InternshipResponse(internshipsMeta: internshipsMap);
  }
}
