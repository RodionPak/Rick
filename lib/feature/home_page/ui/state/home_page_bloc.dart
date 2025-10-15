import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:ricki/feature/home_page/data/api/service/home_page_service_api.dart';
import 'package:ricki/feature/home_page/ui/models/character_models.dart';
import 'package:injectable/injectable.dart';

part 'home_page_event.dart';

part 'home_page_state.dart';

@lazySingleton
class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final HomePageDioService homePageDioService;

  HomePageBloc(this.homePageDioService) : super(HomePageInitial()) {
    on<GetDataCharacterEvent>(_getDataCharacter);
  }

  Future<void> _getDataCharacter(
      GetDataCharacterEvent event,
      Emitter<HomePageState> emit,
      ) async {
    final model = await homePageDioService.getCharacterModel();
    if (model != null){

      emit(SuccessGetCharacterState(model: model));

    }
    else{
      emit(ErrorGetCharacterState());

    }
  }

}
