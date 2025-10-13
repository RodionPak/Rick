import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:ricki/feature/home_page/ui/models/character_models.dart';

part 'detail_character_event.dart';

part 'detail_character_state.dart';

class DetailCharacterBloc extends Bloc<DetailCharacterEvent,DetailCharacterState> {
  DetailCharacterBloc() : super(DetailCharacterInitial()) {
    on<GetSingleCharacterEvent>(_getSingleCharacter);
  }

  Future<void> _getSingleCharacter(
      GetSingleCharacterEvent event,
      Emitter<DetailCharacterState> emit,
      ) async {
    final dio = Dio();
    emit(DetailCharacterLoadState());
    final response = await dio.get('https://rickandmortyapi.com/api/character/${event.id}');

    Character model = Character.fromJson(response.data);

    emit(SuccessGetDetailCharacterState(model: model));
  }
}
