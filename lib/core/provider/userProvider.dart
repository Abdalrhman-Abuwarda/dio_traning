import 'package:dio/dio.dart';
import 'package:dio_traning/core/model/userModel.dart';
import 'package:flutter/cupertino.dart';

import '../data/shared/DioClient.dart';

class UserProvider extends ChangeNotifier{

  List<User> users = [];
  Future<dynamic> getUserProvider() async{
    // User? user;
    dynamic dataResponse = await DioClient().getUser();
    print('this in provider ${dataResponse["data"]}');
    List<dynamic> dataList = dataResponse["data"];
users = dataList.map((element) => User.fromJson(element)).toList();
print('This is the Users $users');
notifyListeners();
  }
}