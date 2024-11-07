class RecipesResponse {
  List<ResultsResponse>? results;
  int? offset;
  int? number;
  int? totalResults;

  RecipesResponse({this.results, this.offset, this.number, this.totalResults});

  RecipesResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <ResultsResponse>[];
      json['results'].forEach((v) {
        results!.add(new ResultsResponse.fromJson(v));
      });
    }
    offset = json['offset'];
    number = json['number'];
    totalResults = json['totalResults'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['offset'] = this.offset;
    data['number'] = this.number;
    data['totalResults'] = this.totalResults;
    return data;
  }
}

class ResultsResponse {
  int? id;
  String? title;
  String? image;
  String? imageType;

  ResultsResponse({this.id, this.title, this.image, this.imageType});

  ResultsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    imageType = json['imageType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['imageType'] = this.imageType;
    return data;
  }
}