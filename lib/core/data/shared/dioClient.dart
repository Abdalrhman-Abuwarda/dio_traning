import 'package:dio/dio.dart';
import 'package:dio_traning/core/model/userModel.dart';

class DioClient {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://demo-api.mr-dev.tech/api/',
    connectTimeout: 50000,
    receiveTimeout: 30000,
  ));
  final _baseUrl = 'http://demo-api.mr-dev.tech/api/users';

  Future<dynamic> getUser() async {
    // User? user;
    try {
      Response response = await _dio.get('users');
      print('User Info ${response.data}');
      // user = User.fromJson(response.data["data"]);
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }
}
