import 'package:clean_architecture_example/src/core/constants/url_constants.dart';
import 'package:clean_architecture_example/src/core/network/dio_client.dart';
import 'package:clean_architecture_example/src/data/models/post_model/post_model.dart';

abstract class PostRemoteDateSource {
  Future<List<PostModel>> GetAllPost();
}

class PostRemoteDateSourceImpl extends PostRemoteDateSource {
  final DioClient _dioClient;

  PostRemoteDateSourceImpl(this._dioClient);
  @override
  Future<List<PostModel>> GetAllPost() async {
    try {
      final response = await _dioClient.get(UrlConstants.getAllPosts);
      print(response);
      final dateList = (response.data as List<dynamic>)
          .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return dateList;
    } on Exception catch (_) {
      rethrow; // hata üst katmana gider
    }
  }
}
