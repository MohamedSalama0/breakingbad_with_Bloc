import 'package:breakingbad_with_bloc/busieness_logic/cubit/characters_cubit.dart';
import 'package:breakingbad_with_bloc/constants/app_style.dart';
import 'package:breakingbad_with_bloc/data/api/characters_api.dart';
import 'package:breakingbad_with_bloc/data/models/character_model.dart';
import 'package:breakingbad_with_bloc/data/repostiory/characters_repostiory.dart';
import 'package:breakingbad_with_bloc/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  var cubit = CharactersCubit(CharactersRepostiory(CharactersApi()));
  final textController = TextEditingController();
  bool isSearching = false;
  late List<CharacterModel> searchedForCharacters = [];
  late List<CharacterModel> allCharacters = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildAppBarSearch() {
    if (isSearching) {
      // print('_isSearching ${cubit.isSearching}');
      return IconButton(
        onPressed: () {

            textController.clear();
            Navigator.pop(context);

        },
        icon: const Icon(
          Icons.clear,
          color: myGrey,
        ),
      );
    } else {
      return IconButton(
        onPressed: () {
          startSearching();
        },
        icon: const Icon(
          Icons.search,
          color: myGrey,
        ),
      );
    }
  }

  Widget buildSearchField() {
    return TextField(
      controller: textController,
      cursorColor: myGrey,
      decoration: const InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: myGrey, fontSize: 18),
      ),
      style: const TextStyle(color: myGrey, fontSize: 18),
      onChanged: (searchedCharacter) {
        searchedForCharacters = allCharacters
            .where((character) =>
                character.name.toLowerCase().startsWith(searchedCharacter))
            .toList();
        setState(() {});
      },
    );
  }

  void startSearching() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove:stopSearching));
    setState(() {
      isSearching = true;
    });
  }

  void stopSearching() {
    setState(() {
      textController.clear();
      isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGrey,
      appBar: AppBar(
        actions: [buildAppBarSearch()],
        title: isSearching
            ? buildSearchField()
            : const Text(
                'Breaking Bad',
                style: TextStyle(
                  color: myGrey,
                ),
              ),
        backgroundColor: myYellow.withOpacity(0.9),
      ),
      body: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoaded) {
            allCharacters = state.characters;
            return SingleChildScrollView(
              child: Container(
                color: myGrey,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                        childAspectRatio: 2 / 3.5,
                      ),
                      itemCount: textController.text.isEmpty
                          ? allCharacters.length
                          : searchedForCharacters.length,
                      itemBuilder: (ctx, index) {
                        return createCharacterItem(
                          /// لازم تت check علي الكاركتر كمان مش الlenght بس عشان كدة مكنش بيفلتر الكاركترز
                          textController.text.isEmpty
                              ? allCharacters[index]
                              : searchedForCharacters[index],
                          ctx,
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            print(state.toString());
            return const Center(
                child: CircularProgressIndicator(
              color: myYellow,
            ));
          }
        },
      ),
    );
  }
}
