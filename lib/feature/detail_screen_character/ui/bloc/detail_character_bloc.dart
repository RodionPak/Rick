import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:ricki/feature/home_page/ui/models/character_models.dart';

import '../../data/api/service/detail_screen_character_service_api.dart';

part 'detail_character_event.dart';

part 'detail_character_state.dart';


@lazySingleton
class DetailCharacterBloc extends Bloc<DetailCharacterEvent, DetailCharacterState> {
  final DetailCharacterServiceApi _service;

  DetailCharacterBloc(this._service) : super(DetailCharacterInitial()) {
    on<GetSingleCharacterEvent>(_getSingleCharacter);
  }

  Future<void> _getSingleCharacter(
      GetSingleCharacterEvent event,
      Emitter<DetailCharacterState> emit,
      ) async {
    emit(DetailCharacterLoadState());
    final model = await _service.getCharacter(event.id);
    emit(SuccessGetDetailCharacterState(model: model));
  }
}

