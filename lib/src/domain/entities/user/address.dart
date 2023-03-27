import 'package:equatable/equatable.dart';

import 'geo.dart';

class Address extends Equatable {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final Geo? geo;

  const Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json['street']?.toString(),
        suite: json['suite']?.toString(),
        city: json['city']?.toString(),
        zipcode: json['zipcode']?.toString(),
        geo: json['geo'] == null
            ? null
            : Geo.fromJson(Map<String, dynamic>.from(json['geo'])),
      );

  Map<String, dynamic> toJson() => {
        if (street != null) 'street': street,
        if (suite != null) 'suite': suite,
        if (city != null) 'city': city,
        if (zipcode != null) 'zipcode': zipcode,
        if (geo != null) 'geo': geo?.toJson(),
      };

  @override
  List<Object?> get props => [street, suite, city, zipcode, geo];
}
