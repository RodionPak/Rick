import '../../../../home_page/ui/models/character_models.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

import '../detail_screen_character_api.dart';

@lazySingleton
class DetailCharacterServiceApi extends DetailScreenCharacterApi {
  final Dio _dio;

  DetailCharacterServiceApi(this._dio);


@override
  Future<Character> getCharacter(int id) async {
    final response = await _dio.get('character/$id');
    return Character.fromJson(response.data);
  }
}