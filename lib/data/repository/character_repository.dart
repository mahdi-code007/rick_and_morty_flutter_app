import 'package:rick_and_morty_app/data/models/characters_model.dart';
import 'package:rick_and_morty_app/data/web_services/character_web_services.dart';


class CharacterRepository{
  final CharacterWebServices characterWebServices;

  CharacterRepository(this.characterWebServices);

  Future<List<Results>> getAllCharacter() async {
    final characters = await characterWebServices.getAllCharacters();
    final data = CharactersModel.fromJson(characters);
    return data.results;
  }
}