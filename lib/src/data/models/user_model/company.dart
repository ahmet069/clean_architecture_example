import 'package:clean_architecture_example/src/domain/entities/user/company.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class CompanyModel extends Equatable {
  final String? name;
  final String? catchPhrase;
  final String? bs;

  const CompanyModel({this.name, this.catchPhrase, this.bs});

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return _$CompanyModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);

  Company toEntity() => Company(name: name, catchPhrase: catchPhrase, bs: bs);

  @override
  List<Object?> get props => [name, catchPhrase, bs];
}
