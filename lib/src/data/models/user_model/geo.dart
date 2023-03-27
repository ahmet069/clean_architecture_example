import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/user/geo.dart';

part 'geo.g.dart';

@JsonSerializable()
class GeoModel extends Equatable {
  final String? lat;
  final String? lng;

  const GeoModel({this.lat, this.lng});

  factory GeoModel.fromJson(Map<String, dynamic> json) =>
      _$GeoModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeoModelToJson(this);

  Geo toEntity() => Geo(lat: lat, lng: lng);

  @override
  List<Object?> get props => [lat, lng];
}
