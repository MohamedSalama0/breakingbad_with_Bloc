import 'package:bloc/bloc.dart';
import 'package:breakingbad_with_bloc/data/api/characters_api.dart';
import 'package:breakingbad_with_bloc/data/models/character_model.dart';
import 'package:breakingbad_with_bloc/data/models/quote.dart';
import 'package:breakingbad_with_bloc/data/repostiory/characters_repostiory.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepostiory charactersRepostiory;
  List<CharacterModel> characters = [];
  late List<CharacterModel> allCharacters = [];

  CharactersCubit(this.charactersRepostiory) : super(CharactersInitial());


  List<CharacterModel> getAllCharacters() {
    charactersRepostiory.getAllCharacters().then((characterspass)
    {
      characters = characterspass;
      emit(CharactersLoaded(characterspass));
    }
    );
    return characters;
  }
  void getQuotes(String charName) {
    charactersRepostiory.getCharactersQuote(charName).then((quote) {
      emit(QuotesLoaded(quote));
    });
  }


}
