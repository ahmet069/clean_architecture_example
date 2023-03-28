import 'package:clean_architecture_example/src/domain/entities/post/post.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel extends Equatable {
  final num? id;
  final num? userId;
  final String? title;
  final String? body;

  const PostModel({this.userId, this.id, this.title, this.body});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return _$PostModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PostModelToJson(this);

  Post toEntity() => Post(
        body: body,
        id: int.parse(id.toString()),
        title: title,
        userId: int.parse(userId.toString()),
      );

  @override
  List<Object?> get props => [
        userId,
        id,
        title,
        body,
      ];
}
