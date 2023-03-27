import 'package:equatable/equatable.dart';

class Geo extends Equatable {
  final String? lat;
  final String? lng;

  const Geo({this.lat, this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json['lat']?.toString(),
        lng: json['lng']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (lat != null) 'lat': lat,
        if (lng != null) 'lng': lng,
      };

  @override
  List<Object?> get props => [lat, lng];
}
