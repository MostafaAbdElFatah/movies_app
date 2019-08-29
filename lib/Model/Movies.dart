import 'dart:convert';
import 'package:floor/floor.dart';

Movies moviesFromJson(String str) => Movies.fromJson(json.decode(str));

String moviesToJson(Movies data) => json.encode(data.toJson());

class Movies {
  List<Movie> movies;

  Movies({
    this.movies,
  });

  factory Movies.fromJson(Map<String, dynamic> json) => new Movies(
    movies: new List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "movies": new List<dynamic>.from(movies.map((x) => x.toJson())),
  };
}

class Movie {

  String movie;
  int year;
  double rating;
  String duration;
  String director;
  String tagline;
  List<Cast> cast;
  String image;
  String story;
  String tralier;

  Movie({
    this.movie,
    this.year,
    this.rating,
    this.duration,
    this.director,
    this.tagline,
    this.cast,
    this.image,
    this.story,
    this.tralier
  });

  factory Movie.fromJson(Map<String, dynamic> json) => new Movie(
    movie: json["movie"],
    year: json["year"],
    rating: json["rating"].toDouble(),
    duration: json["duration"],
    director: json["director"],
    tagline: json["tagline"],
    cast: new List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
    image: json["image"],
    story: json["story"],
    tralier: json["tralier"]
  );

  Map<String, dynamic> toJson() => {
    "movie": movie,
    "year": year,
    "rating": rating,
    "duration": duration,
    "director": director,
    "tagline": tagline,
    "cast": new List<dynamic>.from(cast.map((x) => x.toJson())),
    "image": image,
    "story": story,
    "tralier": tralier
  };

}

class Cast {
  String name;

  Cast({
    this.name,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => new Cast(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

@Entity(tableName: "movie")
class MovieInfo {

  @PrimaryKey(autoGenerate: true)
  int id;
  String movie;
  int year;
  double rating;
  String duration;
  String director;
  String tagline;
  String cast;
  String image;
  String story;
  String tralier;

  MovieInfo({
    this.id,
    this.movie,
    this.year,
    this.rating,
    this.duration,
    this.director,
    this.tagline,
    this.cast,
    this.image,
    this.story,
    this.tralier
  });

  factory MovieInfo.fromJson(Map<String, dynamic> json) => new MovieInfo(
    id: json["id"],
    movie: json["movie"],
    year: json["year"],
    rating: json["rating"].toDouble(),
    duration: json["duration"],
    director: json["director"],
    tagline: json["tagline"],
    cast: json["cast"],
    image: json["image"],
    story: json["story"],
    tralier: json["tralier"],
  );

  Map<String, dynamic> toJson() => {
    "id":id,
    "movie": movie,
    "year": year,
    "rating": rating,
    "duration": duration,
    "director": director,
    "tagline": tagline,
    "cast": cast,
    "image": image,
    "story": story,
    "tralier": tralier
  };
}