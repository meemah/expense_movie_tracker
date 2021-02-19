// // To parse this JSON data, do
// //
// //     final movieModel = movieModelFromJson(jsonString);

import 'dart:convert';

// User userFromJson(String str) => User.fromJson(json.decode(str));
// List<MovieModel> movieModelFromJson(String str) =>
//     List<MovieModel>.from(json.decode(str).map((x) => MovieModel.fromJson(x)));

List<MovieModel> movieModelFromJson(String str) =>
    List<MovieModel>.from(json.decode(str).map((x) => MovieModel.fromJson(x)));

String movieModelToJson(List<MovieModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MovieModel {
  MovieModel({
    this.id,
    this.title,
    this.description,
    this.director,
    this.producer,
    this.releaseDate,
    this.rtScore,
  });

  String id;
  String title;
  String description;
  String director;
  String producer;
  String releaseDate;
  String rtScore;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        director: json["director"],
        producer: json["producer"],
        releaseDate: json["release_date"],
        rtScore: json["rt_score"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "director": director,
        "producer": producer,
        "release_date": releaseDate,
        "rt_score": rtScore,
      };
}

// To parse this JSON data, do
//
//     final movieModel = movieModelFromJson(jsonString);

// import 'dart:convert';

// List<MovieModel> movieModelFromJson(String str) =>
//     List<MovieModel>.from(json.decode(str).map((x) => MovieModel.fromJson(x)));

// String movieModelToJson(List<MovieModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class MovieModel {
//   MovieModel({
//     this.id,
//     this.title,
//     this.description,
//     this.director,
//     this.producer,
//     this.releaseDate,
//     this.rtScore,
//     this.people,
//     this.species,
//     this.locations,
//     this.vehicles,
//     this.url,
//   });

//   String id;
//   String title;
//   String description;
//   String director;
//   String producer;
//   String releaseDate;
//   String rtScore;
//   List<String> people;
//   List<String> species;
//   List<String> locations;
//   List<String> vehicles;
//   String url;

//   factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
//         id: json["id"],
//         title: json["title"],
//         description: json["description"],
//         director: json["director"],
//         producer: json["producer"],
//         releaseDate: json["release_date"],
//         rtScore: json["rt_score"],
//         people: List<String>.from(json["people"].map((x) => x)),
//         species: List<String>.from(json["species"].map((x) => x)),
//         locations: List<String>.from(json["locations"].map((x) => x)),
//         vehicles: List<String>.from(json["vehicles"].map((x) => x)),
//         url: json["url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "description": description,
//         "director": director,
//         "producer": producer,
//         "release_date": releaseDate,
//         "rt_score": rtScore,
//         "people": List<dynamic>.from(people.map((x) => x)),
//         "species": List<dynamic>.from(species.map((x) => x)),
//         "locations": List<dynamic>.from(locations.map((x) => x)),
//         "vehicles": List<dynamic>.from(vehicles.map((x) => x)),
//         "url": url,
//       };
// }
