import 'package:bloc/bloc.dart';
import 'package:rick_and_morty_app/data/models/characters_model.dart';
import 'package:meta/meta.dart';

import '../data/repository/character_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepository characterRepository;
   List<Results> character = [];
  CharactersCubit(this.characterRepository) : super(CharactersInitial());

  List<Results> getAllCharacter(){
    characterRepository.getAllCharacter().then((character) {
      emit(CharacterLoaded(character));
      this.character = character;
    });

    return character;
  }
}
