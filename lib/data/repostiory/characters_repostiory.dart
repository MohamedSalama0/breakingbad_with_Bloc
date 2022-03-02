import 'package:breakingbad_with_bloc/data/api/characters_api.dart';
import 'package:breakingbad_with_bloc/data/models/character_model.dart';
import 'package:breakingbad_with_bloc/data/models/quote.dart';

class CharactersRepostiory
{
  final CharactersApi charactersApi;

  CharactersRepostiory(this.charactersApi);
  Future<List<CharacterModel>> getAllCharacters() async
  {
    final characters = await charactersApi.getAllCharacters();
    return characters.map((character) => CharacterModel.fromJson(character))
        .toList();
  }
  Future<List<Quotes>> getCharactersQuote(String charName) async
  {
    final quotes = await charactersApi.getCharactersQuote(charName);
    return quotes.map((characterQuote) => Quotes.fromJson(characterQuote)).toList();
  }
}