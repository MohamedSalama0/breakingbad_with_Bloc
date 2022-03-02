import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:breakingbad_with_bloc/busieness_logic/cubit/characters_cubit.dart';
import 'package:breakingbad_with_bloc/constants/app_style.dart';
import 'package:breakingbad_with_bloc/constants/size_config.dart';
import 'package:breakingbad_with_bloc/data/models/character_model.dart';
import 'package:breakingbad_with_bloc/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final CharacterModel characterModel;
  double? sizeW = SizeConfig.screenWidth;
  late double? sizeH = SizeConfig.screenHeight;

  CharacterDetailsScreen({Key? key, required this.characterModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactersCubit>(context).getQuotes(characterModel.name);
    return Scaffold(
      backgroundColor: myGrey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 600,
            pinned: true,
            stretch: true,
            backgroundColor: myGrey,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                characterModel.nickName,
                style: TextStyle(color: myWhite),
              ),
              background: Hero(
                tag: characterModel.charID,
                child: Image.network(
                  characterModel.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      characterInfo(
                          title: 'job: ',
                          value: characterModel.jobs.join(' / ')),
                      buildDivider(330),
                      characterInfo(
                          title: 'Apperance in: ',
                          value: characterModel.apperanceOfSeasons.join(' / ')),
                      buildDivider(250),
                      characterInfo(
                          title: 'Status: ',
                          value: characterModel.statusDeadOrAlive),
                      buildDivider(305),
                      characterModel.apperanceBetterCallSaul.isEmpty
                          ? const SizedBox()
                          : characterInfo(
                          title: 'Better Call Saul Seasons: ',
                          value: characterModel.apperanceBetterCallSaul
                              .join(' / ')),
                      characterModel.apperanceBetterCallSaul.isEmpty
                          ? const SizedBox()
                          : buildDivider(160),
                      characterInfo(
                          title: 'Actor/Actress : ',
                          value: characterModel.actorName),
                      buildDivider(240),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<CharactersCubit, CharactersState>(
                        builder: (context, state) {
                          if(state is QuotesLoaded){
                            var quote = state.quote;
                            if(quote.isNotEmpty) {
                              return Center(
                              child: SizedBox(
                              width: sizeW,
                              child: DefaultTextStyle(
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 7.0,
                                      color: myYellow,
                                      offset: Offset(1, 1),
                                    ),
                                  ],
                                ),
                                child: AnimatedTextKit(
                                  repeatForever: true,
                                  animatedTexts: [
                                    FlickerAnimatedText(quote[0].quote.toString()),
                                  ],
                                ),
                              ),
                          ),
                            );
                            }else{
                              return const SizedBox();
                            }
                          }else {
                            return const Center(child: CircularProgressIndicator(color: myYellow,));
                          }
                        },

                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 700,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
