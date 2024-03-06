import 'dart:convert';

import 'package:movies_app/models/models.dart';

class TopRate {
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  TopRate({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TopRate.fromJson(String str) => TopRate.fromMap(json.decode(str));

  factory TopRate.fromMap(Map<String, dynamic> json) => TopRate(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
