part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<CharacterModel> characters;

  CharactersLoaded(this.characters);
}
class QuotesLoaded extends CharactersState {
  late final List<Quotes> quote;

  QuotesLoaded(this.quote);
}


