import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:ricki/feature/home_page/ui/models/character_models.dart';

part 'home_page_event.dart';

part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    on<GetDataCharacterEvent>(_getDataCharacter);
  }

  Future<void> _getDataCharacter(
    GetDataCharacterEvent event,
    Emitter<HomePageState> emit,
  ) async {
    final dio = Dio();
    final response = await dio.get('https://rickandmortyapi.com/api/character');

    CharactersModel model = CharactersModel.fromJson(response.data);

    emit(SuccessGetCharacterState(model: model));
  }

}
