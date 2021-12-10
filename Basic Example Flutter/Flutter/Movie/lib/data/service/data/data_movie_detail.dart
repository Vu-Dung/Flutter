import 'package:json_annotation/json_annotation.dart';

part 'data_movie_detail.g.dart';

@JsonSerializable()
class MovieDetail {
  bool? adult;
  String? backdrop_path;
  BelongsToCollection? belongs_to_collection;
  int? budget;
  List<Genre>? genres;
  String? homepage;
  int? id;
  String? imdb_id;
  String? original_language;
  String? original_title;
  String? overview;
  double? popularity;
  String? poster_path;
  List<ProductionCompany>? production_companies;
  List<ProductionCountry>? production_countries;
  String? release_date;
  int? revenue;
  int? runtime;
  List<SpokenLanguage>? spoken_languages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? vote_average;
  int? vote_count;

  MovieDetail({
    this.adult,
    this.backdrop_path,
    this.belongs_to_collection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdb_id,
    this.original_language,
    this.original_title,
    this.overview,
    this.popularity,
    this.poster_path,
    this.production_companies,
    this.production_countries,
    this.release_date,
    this.revenue,
    this.runtime,
    this.spoken_languages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.vote_average,
    this.vote_count,
  });
  factory MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailToJson(this);
}

@JsonSerializable()
class BelongsToCollection {
  int? id;
  String? name;
  String? poster_path;
  String? backdrop_path;

  BelongsToCollection({
    this.id,
    this.name,
    this.poster_path,
    this.backdrop_path,
  });
  factory BelongsToCollection.fromJson(Map<String, dynamic> json) =>
      _$BelongsToCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$BelongsToCollectionToJson(this);
}

@JsonSerializable()
class Genre {
  int? id;
  String? name;

  Genre({
    this.id,
    this.name,
  });
  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable()
class ProductionCompany {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompany({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });
  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}

@JsonSerializable()
class ProductionCountry {
  String? name;

  ProductionCountry({
    this.name,
  });
  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);
}

@JsonSerializable()
class SpokenLanguage {
  String? englishName;
  String? name;

  SpokenLanguage({
    this.englishName,
    this.name,
  });
  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);
}
