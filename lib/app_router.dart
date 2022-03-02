import 'package:breakingbad_with_bloc/busieness_logic/cubit/characters_cubit.dart';
import 'package:breakingbad_with_bloc/data/api/characters_api.dart';
import 'package:breakingbad_with_bloc/data/models/character_model.dart';
import 'package:breakingbad_with_bloc/data/repostiory/characters_repostiory.dart';
import 'package:breakingbad_with_bloc/view/screens/character_details_screen.dart';
import 'package:breakingbad_with_bloc/view/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersCubit charactersCubit;
  late CharactersRepostiory charactersRepostiory;

  AppRouter() {
    charactersRepostiory = CharactersRepostiory(CharactersApi());
    charactersCubit = CharactersCubit(charactersRepostiory);
  }

  Route<dynamic>? generateRoute(RouteSettings screen) {
    switch (screen.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider(
                  create: (context) => charactersCubit,
                  child: const CharactersScreen(),
                )
        );
      case 'CharacterDetailsScreen':
        final character = screen.arguments as CharacterModel;
        // var test = screen.arguments;
        // print('======>>>> $test');
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider(
                  create: (context) => CharactersCubit(charactersRepostiory),
                  child: CharacterDetailsScreen(characterModel: character,),
                )
        );
    }
  }
}
