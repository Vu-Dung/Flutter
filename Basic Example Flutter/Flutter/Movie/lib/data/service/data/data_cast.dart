import 'package:json_annotation/json_annotation.dart';

part 'data_cast.g.dart';

@JsonSerializable()
class CreditResult {
  int? id;
  List<Cast>? cast;
  List<Cast>? crew;

  CreditResult({
    this.id,
    this.cast,
    this.crew,
  });
  factory CreditResult.fromJson(Map<String, dynamic> json) =>
      _$CreditResultFromJson(json);

  Map<String, dynamic> toJson() => _$CreditResultToJson(this);
}

@JsonSerializable()
class Cast {
  bool? adult;
  int? gender;
  int? id;
  String? known_for_department;
  String? name;
  String? original_name;
  double? popularity;
  String? profile_path;
  int? cast_id;
  String? character;
  String? credit_id;
  int? order;
  String? department;
  String? job;

  Cast({
    this.adult,
    this.gender,
    this.id,
    this.known_for_department,
    this.name,
    this.original_name,
    this.popularity,
    this.profile_path,
    this.cast_id,
    this.character,
    this.credit_id,
    this.order,
    this.department,
    this.job,
  });
  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);
}
