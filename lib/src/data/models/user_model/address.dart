import 'package:clean_architecture_example/src/domain/entities/user/address.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'geo.dart';

part 'address.g.dart';

@JsonSerializable()
class AddressModel extends Equatable {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final GeoModel? geo;

  const AddressModel({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return _$AddressModelFromJson(json);
  }
  Address toEntity() => Address(
        suite: suite,
        street: street,
        city: city,
        zipcode: zipcode,
        geo: geo!.toEntity(),
      );

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);

  @override
  List<Object?> get props => [street, suite, city, zipcode, geo];
}
