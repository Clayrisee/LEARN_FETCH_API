//Create PODO class
class Movie {
  final String title;
  final String poster;

  Movie({this.title, this.poster});

  //Create factory class

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["Title"],
      poster: json["Poster"],
    );
  }
}
