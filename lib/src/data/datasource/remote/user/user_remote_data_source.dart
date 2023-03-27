// ignore_for_file: public_member_api_docs, sort_constructors_first
//*
import '../../../../core/constants/url_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../../../models/user_model/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getAllUsers();
  Future<List<UserModel>> getAllUsers2();
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  final DioClient _dioClient;

  UserRemoteDataSourceImpl(this._dioClient);

  @override
  Future<List<UserModel>> getAllUsers() async {
    try {
      final response = await _dioClient.get(UrlConstants.getAllUsers);
      print(response);
      final dataList = (response.data as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList();

      return dataList;
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<UserModel>> getAllUsers2() {
    throw UnimplementedError();
  }
}
