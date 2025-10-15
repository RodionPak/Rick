import 'package:ricki/feature/home_page/ui/models/character_models.dart';

abstract class HomePageApi {
  Future<CharactersModel?> getCharacterModel();
}
