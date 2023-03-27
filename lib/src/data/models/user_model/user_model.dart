import 'package:clean_architecture_example/src/domain/entities/user/user.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'address.dart';
import 'company.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  final num? id;
  final String? name;
  final String? username;
  final String? email;
  final AddressModel? address;
  final String? phone;
  final String? website;
  final CompanyModel? company;

  const UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  User toEntity() => User(
        id: id,
        name: name,
        address: address!.toEntity(),
        company: company!.toEntity(),
        email: email,
        phone: phone,
        username: username,
        website: website,
      );

  @override
  List<Object?> get props {
    return [
      id,
      name,
      username,
      email,
      address,
      phone,
      website,
      company,
    ];
  }
}
