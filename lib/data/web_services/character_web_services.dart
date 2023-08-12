
import 'package:rick_and_morty_app/constants/strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CharacterWebServices{
  late Dio dio;

  CharacterWebServices(){
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000
    );

    dio = Dio(baseOptions);
  }

  Future<dynamic> getAllCharacters() async {
    try {
      Response response = await dio.get('/character');
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print('${e}catch');
      }
      return null;
    }

  }
}
