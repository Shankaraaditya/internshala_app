import 'package:internshala_app/domain/entities/article.dart';

class InternshipEntity {
  InternshipEntity({
    required this.totalResults,
    required this.articles,
  });

  int totalResults;
  List<Details> articles;
}
