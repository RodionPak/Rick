// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/detail_screen_character/data/api/detail_screen_character_api.dart'
    as _i819;
import '../../feature/detail_screen_character/data/api/service/detail_screen_character_service_api.dart'
    as _i1031;
import '../../feature/detail_screen_character/ui/bloc/detail_character_bloc.dart'
    as _i949;
import '../../feature/home_page/data/api/home_page_api.dart' as _i673;
import '../../feature/home_page/data/api/service/home_page_service_api.dart'
    as _i827;
import '../../feature/home_page/ui/state/home_page_bloc.dart' as _i937;
import 'si.dart' as _i1033;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i673.HomePageApi>(() => registerModule.homePageApi());
  gh.lazySingleton<_i819.DetailScreenCharacterApi>(
    () => registerModule.detailScreenCharacterApi(),
  );
  gh.lazySingleton<_i827.HomePageDioService>(
    () => _i827.HomePageDioService(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i1031.DetailCharacterServiceApi>(
    () => _i1031.DetailCharacterServiceApi(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i949.DetailCharacterBloc>(
    () => _i949.DetailCharacterBloc(gh<_i1031.DetailCharacterServiceApi>()),
  );
  gh.lazySingleton<_i937.HomePageBloc>(
    () => _i937.HomePageBloc(gh<_i827.HomePageDioService>()),
  );
  return getIt;
}

class _$RegisterModule extends _i1033.RegisterModule {}
