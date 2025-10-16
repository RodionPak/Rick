

import '../../../home_page/ui/models/character_models.dart';

abstract class DetailScreenCharacterApi {
  Future<Character?> getCharacter(int id);
}
