import 'package:json_annotation/json_annotation.dart';

part 'data_nowplaying_list.g.dart';

@JsonSerializable()
class NowPlaying {
  Dates? dates;
  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  NowPlaying({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });
  factory NowPlaying.fromJson(Map<String, dynamic> json) =>
      _$NowPlayingFromJson(json);

  Map<String, dynamic> toJson() => _$NowPlayingToJson(this);
}

@JsonSerializable()
class Dates {
  String? maximum;
  String? minimum;

  Dates({
    this.maximum,
    this.minimum,
  });
  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);

  Map<String, dynamic> toJson() => _$DatesToJson(this);
}

@JsonSerializable()
class Result {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Result({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
