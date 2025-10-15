import 'package:dio/dio.dart' show Dio;
import 'package:ricki/feature/home_page/data/api/home_page_api.dart';
import 'package:ricki/feature/home_page/ui/models/character_models.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomePageDioService implements HomePageApi {
  final Dio dio;

  HomePageDioService(this.dio);

  @override
  Future<CharactersModel?> getCharacterModel() async {
    try{
      final response = await dio.get('character');
      CharactersModel model = CharactersModel.fromJson(response.data);
      return model;
    }
    catch(error){
      print ("Error ${error}");
      return null;
    }
  }

}

