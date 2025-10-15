import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:injectable/injectable.dart';
import 'package:ricki/Core/Internal/si.config.dart';
import 'package:ricki/feature/home_page/data/api/home_page_api.dart';
import 'package:ricki/feature/home_page/data/api/service/home_page_service_api.dart';

import '../../feature/detail_screen_character/data/api/detail_screen_character_api.dart';
import '../../feature/detail_screen_character/data/api/service/detail_screen_character_service_api.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() => $initGetIt(getIt);

@module
abstract class RegisterModule {
  Dio get dio {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://rickandmortyapi.com/api/',
        connectTimeout: const Duration(seconds: 5),

      ),
    );
    return dio;
  }





  @lazySingleton
  HomePageApi homePageApi() => HomePageDioService(dio);


  @lazySingleton
  DetailScreenCharacterApi  detailScreenCharacterApi() =>  DetailCharacterServiceApi(dio);
}

