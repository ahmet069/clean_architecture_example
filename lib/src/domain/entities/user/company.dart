import 'package:equatable/equatable.dart';

class Company extends Equatable {
  final String? name;
  final String? catchPhrase;
  final String? bs;

  const Company({this.name, this.catchPhrase, this.bs});

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json['name']?.toString(),
        catchPhrase: json['catchPhrase']?.toString(),
        bs: json['bs']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        if (catchPhrase != null) 'catchPhrase': catchPhrase,
        if (bs != null) 'bs': bs,
      };

  @override
  List<Object?> get props => [name, catchPhrase, bs];
}
